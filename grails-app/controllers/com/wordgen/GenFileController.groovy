package com.wordgen



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GenFileController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond GenFile.list(params), model:[genFileInstanceCount: GenFile.count()]
    }

    def show(GenFile genFileInstance) {
        respond genFileInstance
    }

    def create() {
        respond new GenFile(params)
    }

    @Transactional
    def save(GenFile genFileInstance) {
        if (genFileInstance == null) {
            notFound()
            return
        }

        if (genFileInstance.hasErrors()) {
            respond genFileInstance.errors, view:'create'
            return
        }

        genFileInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'genFile.label', default: 'GenFile'), genFileInstance.id])
                redirect genFileInstance
            }
            '*' { respond genFileInstance, [status: CREATED] }
        }
    }

    def edit(GenFile genFileInstance) {
        respond genFileInstance
    }

    @Transactional
    def update(GenFile genFileInstance) {
        if (genFileInstance == null) {
            notFound()
            return
        }

        if (genFileInstance.hasErrors()) {
            respond genFileInstance.errors, view:'edit'
            return
        }

        genFileInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'GenFile.label', default: 'GenFile'), genFileInstance.id])
                redirect genFileInstance
            }
            '*'{ respond genFileInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(GenFile genFileInstance) {

        if (genFileInstance == null) {
            notFound()
            return
        }

        genFileInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'GenFile.label', default: 'GenFile'), genFileInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'genFile.label', default: 'GenFile'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
