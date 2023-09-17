Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2717123DE
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 19:08:25 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A98115
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 12:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=m7AQ9jBAOCegy1lukj6spk7LXv6nKCl/XmDr8FOfEUw=; b=e1
	Jovj7PHdxE6AHFpsVzFEPus1MKOJRcDVvp/JZlHqSL4eOueiniiGSzDOfkfPZVESTeMqx3OYpcmh8
	FVGRcJz7Pajsjm5oYG/HkSgqo8UTOuTzGrWYijyFVFub+3oaKe4RzrLV4+vC6vKDXd75wwS3itWEy
	kpvoLy5gD/a8Hjc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qhx80-006i2o-Es; Sun, 17 Sep 2023 21:08:20 +0200
Date: Sun, 17 Sep 2023 21:08:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Trevor Gross <tmgross@umich.edu>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
Message-ID: <f55a3e84-3865-432b-b009-c4051f9a3b0b@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com>
 <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
 <20230917.191708.2174483069021340663.ubuntu@gmail.com>
 <3fa5407b-c6f4-4e39-a743-812838b94d28@lunn.ch>
 <CALNs47uCFDJ5xz7_3qkjszmmAFXzA=dwB7CM4+sVeVtnSTZAcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALNs47uCFDJ5xz7_3qkjszmmAFXzA=dwB7CM4+sVeVtnSTZAcQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Sep 17, 2023 at 02:42:02PM -0400, Trevor Gross wrote:
> On Sun, Sep 17, 2023 at 11:07 AM Andrew Lunn <andrew@lunn.ch> wrote:
> > [...]
> > > If abstraction code just declare a function, a driver always need to
> > > implement that function.
> >
> > Ah, that is not going to scale well. There is something like 250
> > struct phy_driver at the moment. We keep adding new ops to that
> > structure. I really don't want to have to modify all 250 of those
> > structures when i add a new op which only one or two drivers need.
> 
> This concern is about adding a function pointer field to the C struct
> without needing to update all future Rust drivers, correct?

Partially. Assuming Rust is successful, and in 10 years time we have
250 devices supported by Rust, i also don't want to have to edit all
250 entries when a new member is added to the Rust version of struct
phy_driver.

> If so,
> that will be fine currently. This comes from where the driver is
> created
> 
> > +    fn driver(&self) -> bindings::phy_driver {
> > +        bindings::phy_driver {
> > +            name: self.name.as_char_ptr() as *mut i8,
> > +            flags: <T>::FLAGS,
> > +            soft_reset: if <T>::HAS_SOFT_RESET {
> > +                Some(Self::soft_reset_callback)
> > +            } else {
> > +                None
> > +            },
> > +            // other fields ...
> > +            ..unsafe { core::mem::MaybeUninit::<bindings::phy_driver>::zeroed().assume_init() }
> > +        }
> 
> The `..` covers all unspecified fields and just says they will be
> zeroed. How this all works is:
> 
> - A trait is created (`Driver`) that has one function for each function
>   pointer field in a C vtable struct (`phy_driver`).
> - Each function in the trait can either have no implementation, (every
>   implementer needs to provide one), or a default implementation, (an
> implementer can
>   optionally provide one or fall back to the default). This is just
> standard Rust, and
>   I think that is what Fujita was saying
> - What the `#[vtable]` macro does is give you a way to check if a
>   implementer/driver provides their own implementation of the default
> method. It does this by
>   setting `HAS_FN_NAME`
> - Then, when creating the c vtable struct from a type that implements the
>   trait, you check that value for each field and either set it to null or to a
>   function pointer
> 
> This means that the `phy_driver` that C sees has null for all
> unimplemented fields and not the default implementation. In the above
> snip creating the `phy_driver`, it checks whether or not the driver
> provides a `soft_reset` implementation with `HAS_SOFT_RESET`, and then
> either sets that field to a null pointer `None` or a function pointer
> `Some(Self::soft_reset_callback)`.

O.K, that is the behaviour we want, in terms of NULL, or a driver
specific function pointer.

A follow up question to this. This currently does not apply to PHY
drivers, but the concept of a structure of function pointers and maybe
a few other data fields exists all over the kernel. There has been an
effort to make them all const, so the C compiler puts them in the
.rodata section. The kernel then uses the MMU to protect it, so it
really is read only. That protects from a class to attacks where a
function pointer gets overwritten and then jumped through.

Can Rust create these structures read only in the .rodata section? Can
this driver actually do this, which would be an improvement over the
current C PHY drivers?

	Andrew

