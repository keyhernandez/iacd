package salias



import org.junit.*
import grails.test.mixin.*

@TestFor(FormaPagoController)
@Mock(FormaPago)
class FormaPagoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/formaPago/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.formaPagoInstanceList.size() == 0
        assert model.formaPagoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.formaPagoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.formaPagoInstance != null
        assert view == '/formaPago/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/formaPago/show/1'
        assert controller.flash.message != null
        assert FormaPago.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/formaPago/list'

        populateValidParams(params)
        def formaPago = new FormaPago(params)

        assert formaPago.save() != null

        params.id = formaPago.id

        def model = controller.show()

        assert model.formaPagoInstance == formaPago
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/formaPago/list'

        populateValidParams(params)
        def formaPago = new FormaPago(params)

        assert formaPago.save() != null

        params.id = formaPago.id

        def model = controller.edit()

        assert model.formaPagoInstance == formaPago
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/formaPago/list'

        response.reset()

        populateValidParams(params)
        def formaPago = new FormaPago(params)

        assert formaPago.save() != null

        // test invalid parameters in update
        params.id = formaPago.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/formaPago/edit"
        assert model.formaPagoInstance != null

        formaPago.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/formaPago/show/$formaPago.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        formaPago.clearErrors()

        populateValidParams(params)
        params.id = formaPago.id
        params.version = -1
        controller.update()

        assert view == "/formaPago/edit"
        assert model.formaPagoInstance != null
        assert model.formaPagoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/formaPago/list'

        response.reset()

        populateValidParams(params)
        def formaPago = new FormaPago(params)

        assert formaPago.save() != null
        assert FormaPago.count() == 1

        params.id = formaPago.id

        controller.delete()

        assert FormaPago.count() == 0
        assert FormaPago.get(formaPago.id) == null
        assert response.redirectedUrl == '/formaPago/list'
    }
}
