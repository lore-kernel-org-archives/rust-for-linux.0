Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA792382F0C
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Mar 2026 20:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654851; cv=none; b=swuQ4Rern428xUrkmNXkjK1mV+FkmrjCnZw8kBXV8v+n1qQHIVqhysYRAU1hmuUoshRTVxxmfWCsAh5CeOxifyZ1WQUadb3XKKGWK8ypFq9caPCy1+9TqlpWzhH2mDAsY/+++cSD8M540Cu/7H4MunkjZHIG9YVnrpRMOyjSYbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654851; c=relaxed/simple;
	bh=4Q5gXi1VGH4oSJdRfVGArQRJrUqRNfVe/YivtZ9jmpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E0Z8wyW6gpm6kAeJDYreo05fSJ9DFZggca5DNh55GvkA32AfDOhCUCOSZFkzPI+HXm08AgByJgv5GwON0r1lE4H8yV2ubcSH6ltqILMBgRqU3JAUZRNfjVMJ7b4r1tTCURJjgLE6jbONfLFQNHPhTi7cZlFqTLPtGtyPZ6o/wHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCd/y9zD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCd/y9zD"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so56123555e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Mar 2026 12:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654847; x=1773259647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4sIPSqa5rL8sJXD2bRZv3ZVoA8xgp/jeEH+qTYdci4=;
        b=mCd/y9zD+IcOe7UX1N+C0ue40D/EBgUh5o5PuZPe479unfT3OpGZuyHNCCDXZSdGqs
         jMRaUWiaPfFJwYoE2Xh9WMvUeai1ar0j/sb46geIOVj+f/dn/JnFm/fiHqpz3R/b8vxr
         GSOnfsBGtuiDiKAjXYGPGDE0LE6VVlnbU0KDormpokjLb6ODFpSSkxE2jJ0JLhc6IX6c
         wXdypP+kGSV1v22CoRTBOhHPayPGc+tj4cZFqlcG34PN0WwnDU2XaSbqWpKyAdeWbp1E
         RQr5XE0YGzAxbmu9BrnQQ7TebfQwbvAzXFzdC4QA7JQL79ssfVX9dR6axYiYBFD+oj8j
         0bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654847; x=1773259647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P4sIPSqa5rL8sJXD2bRZv3ZVoA8xgp/jeEH+qTYdci4=;
        b=ukGnelzxMd8QIW5JQKoXvu+Vj/95+yh/WoEWx660sOXjyyWdbx70Of1Zpc0THGPLEm
         KS0CQMkCdY83fA+16qaArJJCgiB7AZbZAqjTzBY2/rQvm2ugbGGo57odudcXFy9u3JnL
         N2eyHXmoImtQnpYjyGz6Z/Uy0C4NBmY8aIn9RnOjwDcSch9nIQIvgCHE+gw+kZ58NLN4
         wu4pfNdDmcMqasob7tpfrxXREg9IdQXNIgOC5DEWISshxCiNAha4f0zwcybG3gWEVM8O
         S1qPZj5o++5yY3MGuDntra4F4UYury+Aq7cXBhWPYnORVAJlK1jGgQ6ltvQXMDhlaDWV
         Rgsg==
X-Forwarded-Encrypted: i=1; AJvYcCWiazJRjtmnSKwuk9cUCPUe7t/EaRsPQvloh3JJJYrXCYWvRoprNJ0RY4VihAMr5Q/o0DSR24tmzSWVRzqnyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIiUa8cl2Sdksh/Pztpera2Lvulpd2uAJMJ72FBnn1dkORkvpS
	OEXs0zwMgeAQgu19SHuxxm5IR8jBUbmxQ2ewOlc4EAGQf9txI6eiEsKP
X-Gm-Gg: ATEYQzwPN7CQaht3VMaaNsDzyOoG0xGgOuZRhWM8JKHjwpCedf/3phwpvdY9iDSB7iP
	4qUZjuXpXpLz78vuJlL36dyd56FM/z36BaXjxGB5e160HzTS6w0a4V9J8iFKabtMCUuZsetGFDa
	O1f3yW9y+UokkW4q6hk7EmSzQFnwOI+gp1W27cyL79IMnbAnp4Qmxxw/fQZSsU3zPBC+8LrWUfa
	nS4FT39q32eUJp5d/O94tDfmzOANKdmqmMJHXd2Fwr86aO74OMrxeKbHW3Y9MQnHnXgrK6JT2pK
	4RhOsyS/KAH41nF37DbRSXdZ7ljSo7IZq6pUQ+Tl6OBiVi60w5vbZPedczbqf+M5ooQC75cuSa1
	zRHNwAMAc36Df+TTliwJcazQvoQrm475JcEdTlo/fncSBV/fvx2PSUEg3QnaRzmHc5MNPUaVntI
	4wXseOHFTowzVgrCvNxqw4mgckNR9MqOkK+/P/FrJheaU3ThJwvYK/IIdTN69hMvv1NRJWigwBR
	SKmsxTY+GbahZY8HHpbPaBZBNfaaXoieZV7JSMDosQfQvw=
X-Received: by 2002:a05:600c:1f13:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-485198b1d3emr49221405e9.32.1772654846795;
        Wed, 04 Mar 2026 12:07:26 -0800 (PST)
Received: from localhost.localdomain ([80.233.57.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851881224csm68872885e9.13.2026.03.04.12.07.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Mar 2026 12:07:26 -0800 (PST)
From: Edwin Toribio <edwin.toribio.j@gmail.com>
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: carlos.bilbao@kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Edwin Toribio <edwin.toribio.j@gmail.com>
Subject: [PATCH v2 3/3] docs: sp_SP: Add Spanish translation for Rust coding guidelines
Date: Wed,  4 Mar 2026 20:07:13 +0000
Message-ID: <20260304200715.76360-4-edwin.toribio.j@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
References: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Edwin Toribio <edwin.toribio.j@gmail.com>
---
 .../sp_SP/rust/coding-guidelines.rst          | 543 ++++++++++++++++++
 .../translations/sp_SP/rust/index.rst         |  45 ++
 2 files changed, 588 insertions(+)
 create mode 100644 Documentation/translations/sp_SP/rust/coding-guidelines.rst
 create mode 100644 Documentation/translations/sp_SP/rust/index.rst

diff --git a/Documentation/translations/sp_SP/rust/coding-guidelines.rst b/Documentation/translations/sp_SP/rust/coding-guidelines.rst
new file mode 100644
index 000000000..084925d3d
--- /dev/null
+++ b/Documentation/translations/sp_SP/rust/coding-guidelines.rst
@@ -0,0 +1,543 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-sp.rst
+
+:Original: Documentation/rust/coding-guidelines.rst
+:Translator: Edwin Toribio <edwin.toribio.j@gmail.com>
+
+.. _sp_rust_coding_guidelines:
+
+===============================
+Pautas de codificación de Rust
+===============================
+
+Este documento describe cómo escribir código Rust en el kernel.
+
+Estilo y formato
+----------------
+
+El código debe formatearse utilizando ``rustfmt``. De esta manera, una persona
+que contribuya de vez en cuando al kernel no necesita aprender y recordar una
+guía de estilo adicional. Más importante aún, los revisores y mantenedores
+ya no necesitan dedicar tiempo a señalar problemas de estilo y, por lo tanto,
+es posible que se necesiten menos rondas de parches para aplicar un cambio.
+
+.. note:: Las convenciones sobre comentarios y documentación no son verificadas por
+  ``rustfmt``. Por lo tanto, todavía es necesario encargarse de ellas.
+
+Se utilizan los ajustes predeterminados de ``rustfmt``. Esto significa que se sigue
+el estilo idiomático de Rust. Por ejemplo, se utilizan 4 espacios para la
+sangría en lugar de tabulaciones.
+
+Es conveniente configurar los editores/IDE para que formateen al escribir, al
+guardar o al momento de realizar el commit. Sin embargo, si por alguna
+razón es necesario reformatear todas las fuentes de Rust del kernel en algún
+momento, se puede ejecutar lo siguiente::
+
+	make LLVM=1 rustfmt
+
+También es posible comprobar si todo está formateado (imprimiendo un diff en
+caso contrario), p. ej., para una CI (Integración Continua), con::
+
+	make LLVM=1 rustfmtcheck
+
+Al igual que ``clang-format`` para el resto del kernel, ``rustfmt`` funciona en
+archivos individuales y no requiere una configuración del kernel. A veces,
+incluso puede funcionar con código que contenga errores.
+
+Importaciones
+~~~~~~~~~~~~~
+
+``rustfmt``, por defecto, formatea las importaciones de una manera propensa a
+conflictos durante las fusiones (*merges*) y reajustes (*rebases*), ya que en algunos
+casos condensa varios elementos en la misma línea. Por ejemplo:
+
+.. code-block:: rust
+
+	// No use este estilo.
+	use crate::{
+	    example1,
+	    example2::{example3, example4, example5},
+	    example6, example7,
+	    example8::example9,
+	};
+
+En su lugar, el kernel utiliza un diseño vertical que se ve así:
+
+.. code-block:: rust
+
+	use crate::{
+	    example1,
+	    example2::{
+	        example3,
+	        example4,
+	        example5, //
+	    },
+	    example6,
+	    example7,
+	    example8::example9, //
+	};
+
+Es decir, cada elemento va en su propia línea, y se utilizan llaves tan pronto como
+haya más de un elemento en una lista. 
+
+El comentario vacío al final permite preservar este formato. No solo eso, ``rustfmt`` 
+reformateará de hecho las importaciones verticalmente cuando se añade el comentario vacío.
+Importaciones
+~~~~~~~~~~~~~
+
+``rustfmt``, por defecto, formatea las importaciones de una manera propensa a
+conflictos durante las fusiones (*merges*) y reajustes (*rebases*), ya que en algunos
+casos condensa varios elementos en la misma línea. Por ejemplo:
+
+.. code-block:: rust
+
+	// No use este estilo.
+	use crate::{
+	    example1,
+	    example2::{example3, example4, example5},
+	    example6, example7,
+	    example8::example9,
+	};
+
+En su lugar, el kernel utiliza un diseño vertical que se ve así:
+
+.. code-block:: rust
+
+	use crate::{
+	    example1,
+	    example2::{
+	        example3,
+	        example4,
+	        example5, //
+	    },
+	    example6,
+	    example7,
+	    example8::example9, //
+	};
+
+Es decir, cada elemento va en su propia línea, y se utilizan llaves tan pronto como
+haya más de un elemento en una lista.
+
+El comentario vacío al final permite preservar este formato. No solo eso,
+``rustfmt`` reformateará de hecho las importaciones verticalmente cuando se añade el
+comentario vacío. Es decir, es posible reformatear fácilmente el ejemplo original
+al estilo esperado ejecutando ``rustfmt`` sobre una entrada como:
+
+.. code-block:: rust
+
+    // No use este estilo.
+    use crate::{
+        example1,
+        example2::{example3, example4, example5, //
+        },
+        example6, example7,
+        example8::example9, //
+    };
+
+El comentario vacío al final funciona para importaciones anidadas, como se muestra
+arriba, así como para importaciones de un solo elemento; esto puede ser útil para
+minimizar los diffs dentro de las series de parches:
+
+.. code-block:: rust
+
+    use crate::{
+        example1, //
+    };
+
+El comentario vacío al final funciona en cualquiera de las líneas dentro de las
+llaves, pero se prefiere mantenerlo en el último elemento, ya que recuerda a la
+coma final en otros formateadores. A veces puede ser más sencillo evitar mover el
+comentario varias veces dentro de una serie de parches debido a cambios en la lista.
+
+Puede haber casos en los que sea necesario hacer excepciones, p. ej., nada de esto es
+una regla estricta. También hay código que aún no ha sido migrado a este estilo, pero
+por favor, no introduzca código en otros estilos.
+
+Eventualmente, el objetivo es conseguir que ``rustfmt`` soporte este estilo de
+formateo (o uno similar) automáticamente en una versión estable sin requerir el
+comentario vacío al final. Por lo tanto, en algún momento, el objetivo es eliminar
+esos comentarios.
+
+
+Comentarios
+-----------
+
+Los comentarios "normales" (p. ej., ``//``, en lugar de la documentación del
+código que comienza con ``///`` o ``//!``) se escriben en Markdown de la misma
+manera que los comentarios de documentación, aunque no se renderizarán. Esto
+mejora la consistencia, simplifica las reglas y permite mover contenido entre
+los dos tipos de comentarios más fácilmente. Por ejemplo:
+
+.. code-block:: rust
+
+    // `object` está listo para ser manejado ahora.
+    f(object);
+
+Además, al igual que la documentación, los comentarios comienzan con mayúscula
+al principio de una oración y terminan con un punto (aunque sea una sola
+oración). Esto incluye ``// SAFETY:``, ``// TODO:`` y otros comentarios
+"etiquetados", p. ej.:
+
+.. code-block:: rust
+
+    // FIXME: El error debe manejarse adecuadamente.
+
+Los comentarios no deben utilizarse con fines de documentación: los comentarios
+están destinados a los detalles de implementación, no a los usuarios. Esta
+distinción es útil incluso si el lector del archivo fuente es tanto un
+implementador como un usuario de una API. De hecho, a veces es útil usar tanto
+comentarios como documentación al mismo tiempo. Por ejemplo, para una lista
+``TODO`` o para comentar sobre la documentación misma. En este último caso,
+los comentarios pueden insertarse en el medio; es decir, más cerca de la línea
+de documentación que se desea comentar. Para cualquier otro caso, los
+comentarios se escriben después de la documentación, p. ej.:
+
+.. code-block:: rust
+
+    /// Devuelve un nuevo [`Foo`].
+    ///
+    /// # Ejemplos
+    ///
+    // TODO: Encontrar un mejor ejemplo.
+    /// ```
+    /// let foo = f(42);
+    /// ```
+    // FIXME: Usar un enfoque falible(basado en errores).
+    pub fn f(x: i32) -> Foo {
+        // ...
+    }
+
+Esto se aplica tanto a elementos públicos como privados. Esto aumenta la
+consistencia con los elementos públicos, permite cambios de visibilidad con
+menos cambios involucrados y nos permitirá generar potencialmente la
+documentación también para elementos privados. En otras palabras, si se escribe
+documentación para un elemento privado, se debe seguir utilizando ``///``.
+Por ejemplo:
+
+.. code-block:: rust
+
+    /// Mi función privada.
+    // TODO: ...
+    fn f() {}
+
+Un tipo especial de comentarios son los comentarios ``// SAFETY:``. Estos deben
+aparecer antes de cada bloque ``unsafe``, y explican por qué el código dentro
+del bloque es correcto/seguro, es decir, por qué no puede activar un
+comportamiento indefinido en ningún caso, p. ej.:
+
+.. code-block:: rust
+
+    // SAFETY: `p` es válido según los requisitos de seguridad.
+    unsafe { *p = 0; }
+
+Los comentarios ``// SAFETY:`` no deben confundirse con las secciones
+``# Safety`` en la documentación del código. Las secciones ``# Safety``
+especifican el contrato de quienes invocan (para funciones) o los
+implementadores (para traits) deben cumplir. Los comentarios ``// SAFETY:``
+muestran por qué una llamada (para funciones) o una implementación (para
+traits) realmente respeta las condiciones previas establecidas en una sección
+``# Safety`` o en la referencia del lenguaje.
+
+Documentación del código
+------------------------
+
+El código de Rust del kernel no se documenta como el código de C del kernel (p. ej.,
+a través de kernel-doc). En su lugar, se utiliza el sistema habitual para
+documentar código Rust: la herramienta ``rustdoc``, que utiliza Markdown (un
+lenguaje de marcado ligero).
+
+Para aprender Markdown, hay muchas guías disponibles. Por ejemplo, la que se
+encuentra en:
+
+    https://commonmark.org/help/
+
+Así es como podría verse una función de Rust bien documentada:
+
+.. code-block:: rust
+
+    /// Devuelve el valor [`Some`] contenido, consumiendo el valor `self`,
+    /// sin comprobar que el valor no sea [`None`].
+    ///
+    /// # Safety
+    ///
+    /// Invocar este método en [`None`] es *[comportamiento indefinido]*.
+    ///
+    /// [comportamiento indefinido]: https://doc.rust-lang.org/reference/behavior-considered-undefined.html
+    ///
+    /// # Ejemplos
+    ///
+    /// ```
+    /// let x = Some("aire");
+    /// assert_eq!(unsafe { x.unwrap_unchecked() }, "aire");
+    /// ```
+    pub unsafe fn unwrap_unchecked(self) -> T {
+        match self {
+            Some(val) => val,
+
+            // SAFETY: El contrato de seguridad debe ser respetado por quien invoca.
+            None => unsafe { hint::unreachable_unchecked() },
+        }
+    }
+
+Este ejemplo muestra algunas características de ``rustdoc`` y algunas convenciones
+seguidas en el kernel:
+
+- El primer párrafo debe ser una sola oración que describa brevemente lo que
+  hace el elemento documentado. Las explicaciones adicionales deben ir en
+  párrafos extra.
+
+- Las funciones inseguras (``unsafe``) deben documentar sus condiciones previas
+  de seguridad bajo una sección ``# Safety``.
+
+- Aunque no se muestra aquí, si una función puede entrar en pánico (``panic``),
+  las condiciones bajo las cuales esto sucede deben describirse bajo una
+  sección ``# Panics``.
+
+  Por favor, tenga en cuenta que entrar en pánico debe ser muy raro y usarse
+  solo con una buena razón. En casi todos los casos, se debe usar un enfoque
+  basado en errores, devolviendo típicamente un ``Result``.
+
+- Si proporcionar ejemplos de uso ayudara a los lectores, estos deben escribirse
+  en una sección llamada ``# Ejemplos``.
+
+- Los elementos de Rust (funciones, tipos, constantes...) deben estar vinculados
+  apropiadamente (``rustdoc`` creará un enlace automáticamente).
+
+- Cualquier bloque ``unsafe`` debe estar precedido por un comentario ``// SAFETY:``
+  que describa por qué el código interior es seguro.
+
+  Aunque a veces la razón pueda parecer trivial y, por lo tanto, innecesaria,
+  escribir estos comentarios no es solo una buena manera de documentar lo que
+  se ha tenido en cuenta, sino que, lo más importante, proporciona una forma de
+  saber que no existen restricciones implícitas *adicionales*.
+
+Para obtener más información sobre cómo escribir documentación para Rust y
+características adicionales, consulte el libro de ``rustdoc`` en:
+
+    https://doc.rust-lang.org/rustdoc/how-to-write-documentation.html
+
+Además, el kernel admite la creación de enlaces relativos al árbol de fuentes
+anteponiendo al destino del enlace ``srctree/``. Por ejemplo:
+
+.. code-block:: rust
+
+    //! Cabecera C: [`include/linux/printk.h`](srctree/include/linux/printk.h)
+
+o:
+
+.. code-block:: rust
+
+    /// [`struct mutex`]: srctree/include/linux/mutex.h
+
+
+Tipos FFI de C
+--------------
+
+El código de Rust del kernel se refiere a los tipos de C, como ``int``, utilizando
+alias de tipos como ``c_int``, que están disponibles en el preludio de ``kernel``.
+Por favor, no use los alias de ``core::ffi``; es posible que no se mapeen a los
+tipos correctos.
+
+Por lo general, se debe hacer referencia a estos alias directamente por su
+identificador; es decir, como una ruta de un solo segmento. Por ejemplo:
+
+.. code-block:: rust
+
+    fn f(p: *const c_char) -> c_int {
+        // ...
+    }
+
+Nomenclatura
+------------
+
+El código de Rust del kernel sigue las convenciones habituales de nomenclatura de Rust:
+
+    https://rust-lang.github.io/api-guidelines/naming.html
+
+Cuando los conceptos de C existentes (p. ej., macros, funciones, objetos...) se
+envuelven en una abstracción de Rust, se debe utilizar un nombre lo más cercano
+posible al lado de C para evitar confusiones y mejorar la legibilidad al cambiar
+entre los lados de C y Rust. Por ejemplo, las macros como ``pr_info``
+de C se nombran igual en el lado de Rust.
+
+Dicho esto, el uso de mayúsculas y minúsculas (*casing*) debe ajustarse para seguir
+las convenciones de nomenclatura de Rust, y el espacio de nombres (*namespacing*)
+introducido por módulos y tipos no debe repetirse en los nombres de los elementos.
+Por ejemplo, al envolver constantes como:
+
+.. code-block:: c
+
+    #define GPIO_LINE_DIRECTION_IN  0
+    #define GPIO_LINE_DIRECTION_OUT 1
+
+El equivalente en Rust podría verse así (ignorando la documentación):
+
+.. code-block:: rust
+
+    pub mod gpio {
+        pub enum LineDirection {
+            In = bindings::GPIO_LINE_DIRECTION_IN as _,
+            Out = bindings::GPIO_LINE_DIRECTION_OUT as _,
+        }
+    }
+
+Es decir, el equivalente de ``GPIO_LINE_DIRECTION_IN`` se referenciaría como
+``gpio::LineDirection::In``. En particular, no debería nombrarse
+``gpio::gpio_line_direction::GPIO_LINE_DIRECTION_IN``.
+
+Lints
+-----
+
+En Rust, es posible permitir (``allow``) advertencias particulares (diagnósticos,
+lints) localmente, haciendo que el compilador ignore las instancias de una
+advertencia determinada dentro de una función, módulo o bloque específico, etc.
+
+Es similar a ``#pragma GCC diagnostic push`` + ``ignored`` + ``pop`` en C
+[#]_:
+
+.. code-block:: c
+
+    #pragma GCC diagnostic push
+    #pragma GCC diagnostic ignored "-Wunused-function"
+    static void f(void) {}
+    #pragma GCC diagnostic pop
+
+.. [#] En este caso particular, pueden utilizarse los atributos
+       ``__{always,maybe}_unused`` del kernel (el ``[[maybe_unused]]`` de C23);
+       sin embargo, el ejemplo pretende reflejar el lint equivalente en Rust
+       que se analiza a continuación.
+
+Pero es mucho menos prolijo(``verbose``):
+
+.. code-block:: rust
+
+    #[allow(dead_code)]
+    fn f() {}
+
+Gracias a esa virtud, es posible habilitar cómodamente más diagnósticos por
+defecto (es decir, fuera de los niveles ``W=``). En particular, aquellos que
+pueden tener algunos falsos positivos pero que, de otro modo, son bastante útiles
+de mantener habilitados para detectar posibles errores.
+
+Además de eso, Rust proporciona el atributo ``expect``, que lleva esto más allá.
+Hace que el compilador advierta si la advertencia no se produjo. Por ejemplo, lo
+siguiente asegurará que, cuando se llame a ``f()`` en algún lugar, tengamos que
+eliminar el atributo:
+
+.. code-block:: rust
+
+    #[expect(dead_code)]
+    fn f() {}
+
+Si no lo hacemos, recibimos una advertencia del compilador::
+
+    warning: this lint expectation is unfulfilled
+     --> x.rs:3:10
+      |
+    3 | #[expect(dead_code)]
+      |          ^^^^^^^^^
+      |
+      = note: `#[warn(unfulfilled_lint_expectations)]` on by default
+
+Esto significa que los ``expect`` no se olvidan cuando ya no son necesarios, lo
+que puede ocurrir en varias situaciones, p. ej.:
+
+- Atributos temporales añadidos durante el desarrollo.
+
+- Mejoras en los lints del compilador, Clippy o herramientas personalizadas que
+  pueden eliminar un falso positivo.
+
+- Cuando el lint ya no es necesario porque se esperaba que fuera eliminado en
+  algún momento, como el ejemplo de ``dead_code`` anterior.
+
+También aumenta la visibilidad de los ``allow`` restantes y reduce la posibilidad
+de aplicar uno incorrectamente.
+
+Por lo tanto, prefiera ``expect`` sobre ``allow`` a menos que:
+
+- La compilación condicional active la advertencia en algunos casos pero no en
+  otros.
+
+  Si solo hay unos pocos casos en los que se activa la advertencia (o no se
+  activa) en comparación con el número total de casos, entonces se puede
+  considerar el uso de un ``expect`` condicional (es decir,
+  ``cfg_attr(..., expect(...))``). De lo contrario, es probable que sea más
+  sencillo usar simplemente ``allow``.
+
+- Dentro de macros, cuando las diferentes invocaciones pueden crear código
+  expandido que activa la advertencia en algunos casos pero no en otros.
+
+- Cuando el código puede activar una advertencia para algunas arquitecturas
+  pero no para otras, como un moldeado (*cast*) ``as`` a un tipo FFI de C.
+
+Como ejemplo más desarrollado, considere por ejemplo este programa:
+
+.. code-block:: rust
+
+    fn g() {}
+
+    fn main() {
+        #[cfg(CONFIG_X)]
+        g();
+    }
+
+Aquí, la función ``g()`` es código muerto (*dead code*) si ``CONFIG_X`` no está
+establecido. ¿Podemos usar ``expect`` aquí?
+
+.. code-block:: rust
+
+    #[expect(dead_code)]
+    fn g() {}
+
+    fn main() {
+        #[cfg(CONFIG_X)]
+        g();
+    }
+
+Esto emitiría un lint si ``CONFIG_X`` está establecido, ya que no es código muerto
+en esa configuración. Por lo tanto, en casos como este, no podemos usar ``expect``
+tal cual.
+
+Una posibilidad simple es usar ``allow``:
+
+.. code-block:: rust
+
+    #[allow(dead_code)]
+    fn g() {}
+
+    fn main() {
+        #[cfg(CONFIG_X)]
+        g();
+    }
+
+Una alternativa sería usar un ``expect`` condicional:
+
+.. code-block:: rust
+
+    #[cfg_attr(not(CONFIG_X), expect(dead_code))]
+    fn g() {}
+
+    fn main() {
+        #[cfg(CONFIG_X)]
+        g();
+    }
+
+Esto aseguraría que, si alguien introduce otra llamada a ``g()`` en algún lugar
+(p. ej., de forma incondicional), entonces se detectaría que ya no es código muerto.
+Sin embargo, el ``cfg_attr`` es más complejo que un simple ``allow``.
+
+Por lo tanto, es probable que no valga la pena usar ``expect`` condicionales cuando
+están involucradas más de una o dos configuraciones o cuando el lint puede
+activarse debido a cambios no locales (como ``dead_code``).
+
+Para obtener más información sobre diagnósticos en Rust, consulte:
+
+    https://doc.rust-lang.org/stable/reference/attributes/diagnostics.html
+
+Manejo de errores
+-----------------
+
+Para obtener información de referencia y pautas sobre el manejo de errores
+específicos de Rust para Linux, consulte:
+
+    https://rust.docs.kernel.org/kernel/error/type.Result.html#error-codes-in-c-and-rust
\ No newline at end of file
diff --git a/Documentation/translations/sp_SP/rust/index.rst b/Documentation/translations/sp_SP/rust/index.rst
new file mode 100644
index 000000000..ff1db4487
--- /dev/null
+++ b/Documentation/translations/sp_SP/rust/index.rst
@@ -0,0 +1,45 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-sp.rst
+
+:Original: Documentation/rust/quick-start.rst
+:Translator: Edwin Toribio <edwin.toribio.j@gmail.com>
+
+.. _sp_rust_index:
+
+Rust
+====
+
+Documentación relacionada con Rust dentro del kernel. Para empezar a usar Rust
+en el kernel, por favor lea la guía quick-start.rst.
+
+Documentación del código
+------------------------
+
+Dada una configuración del kernel, el kernel puede generar documentación del
+código Rust, p. ej., HTML renderizado por la herramienta ``rustdoc``.
+
+.. only:: rustdoc and html
+
+    Esta documentación del kernel fue construida con la `documentación del código Rust
+    <rustdoc/kernel/index.html>`_.
+
+.. only:: not rustdoc and html
+
+    Esta documentación del kernel no fue construida con la documentación del código Rust.
+
+Se proporciona una versión pregenerada en:
+
+    https://rust.docs.kernel.org
+
+Por favor, consulte la sección :ref:`Documentación del código <rust_code_documentation>`
+para más detalles.
+
+.. toctree::
+    :maxdepth: 1
+
+    quick-start
+    general-information
+    coding-guidelines
+
+También puede encontrar materiales de aprendizaje para Rust en su sección en
+:doc:`../process/kernel-docs`.
\ No newline at end of file
-- 
2.53.0

