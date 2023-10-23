Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AA279F9
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Oct 2023 10:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="Jn8LcuGo"
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4628D66
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Oct 2023 03:49:03 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40806e40fccso23026045e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Oct 2023 03:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1698058142; x=1698662942; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=PxxSsu42bs3+Iwqm/wDWLkLK1lFZbZiMJDO4ZsnwkfE=;
        b=Jn8LcuGozOC7U9dgYnfVJAKT99EVIDwx995+W6LWlcX6zJqqFeN93pn77C5H7fuqJI
         8J4A7L/KbTLy9IY5ODhokjkG9SN9O5nsyytYw/7r3icBj+xCM+D0/sCnCZnM1ExBW68I
         5EUf5BcB63D6AMPR6UbB15dmd4RtLbXeYVLXaErtNva+ANA6AmqiPUfVl6MZZPD53IoP
         vxMdhVnsEjaUBMCn5YyICQ3BcRRDkBYISQYJL5SH92MJVJhRKXM65lP2rnyzH6SI7V+G
         PM18aYHxYgiHqe+DgOZkeMCegzvaXJnkCa+S9DHvWjREP6DbJGsHfC5n/pG8clCOQMC8
         61Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698058142; x=1698662942;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxxSsu42bs3+Iwqm/wDWLkLK1lFZbZiMJDO4ZsnwkfE=;
        b=WUXPYnja/xMhzEOXMkPvTpo6FOd4TOj/kuX2HAFyAx/oS2MFcJS8s208GiIkPXnwxK
         n7Ymfjz9M5tnY+YSs5GlZ7D4SsOavn9XmWJC8JQEkeiEbPWmbIXJwq/pxIl6vR9O8Ajt
         oI9pOx0Z8Jsfhfadd3Dot00tAX+X2LV44/NhsHRFo18sk3GbtSydQIMVPDMkZinKxdom
         3ugyU0tml9pIADrA15pwpJWw19W+2RkAxek6+KwxZfZI0wwc5jvyDpO4/OZuuA+Gp7ue
         W89lwLfAVmrZ3nUNsb8euBsNrlo+Sr6ROuTu9z0adz/PZcZTLpeQutTKX/4WvpClDDJy
         4qEQ==
X-Gm-Message-State: AOJu0YwEwlPePs0kVsl3gNxQSUoBHmY+fu0rT9ZMFHSVBWULkMEjCWW7
	fEO+8cCSKSP1bk8ulkfV11i/Ig==
X-Google-Smtp-Source: AGHT+IGE8vjdY1gUQoWouASrmp6/loTLmbA6TTrfY0sIMkyhTT3AUKwq2ef1szeJ9zVf38zVjYfyvA==
X-Received: by 2002:a05:600c:19d1:b0:405:7b92:453e with SMTP id u17-20020a05600c19d100b004057b92453emr7459123wmq.37.1698058142026;
        Mon, 23 Oct 2023 03:49:02 -0700 (PDT)
Received: from localhost ([165.225.194.214])
        by smtp.gmail.com with ESMTPSA id w11-20020a05600c474b00b00405959469afsm9151952wmo.3.2023.10.23.03.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 03:49:01 -0700 (PDT)
References: <20231018122518.128049-1-wedsonaf@gmail.com>
 <20231018122518.128049-10-wedsonaf@gmail.com>
 <ZTATIhi9U6ObAnN7@casper.infradead.org>
 <CANeycqoWfWJ5bxuh+UWK99D9jYH0cKKy1=ikHJTpY=fP1ZJMrg@mail.gmail.com>
 <ZTAwLGi4sCup+B1r@casper.infradead.org>
 <CANeycqrp_s20pCO_OJXHpqN5tZ_Uq5icTupWiVeLf69JOFj4cA@mail.gmail.com>
 <ZTH9+sF+NPyRjyRN@casper.infradead.org>
User-agent: mu4e 1.10.7; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Matthew Wilcox <willy@infradead.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Kent
 Overstreet <kent.overstreet@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Wedson Almeida Filho
 <walmeida@microsoft.com>
Subject: Re: [RFC PATCH 09/19] rust: folio: introduce basic support for folios
Date: Mon, 23 Oct 2023 12:48:33 +0200
In-reply-to: <ZTH9+sF+NPyRjyRN@casper.infradead.org>
Message-ID: <87h6mhfwbm.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Matthew Wilcox <willy@infradead.org> writes:

(snip)

>> > Something I forgot to mention was that I found it more useful to express
>> > "map this chunk of a folio" in bytes rather than pages.  You might find
>> > the same, in which case it's just folio.map(offset: usize) instead of
>> > folio.map_page(page_index: usize)
>> 
>> Oh, thanks for the feedback. I'll switch to bytes then for v2.
>> (Already did in the example above.)
>
> Great!  Something else I think would be a good idea is open-coding some
> of the trivial accessors.  eg instead of doing:
>
> +size_t rust_helper_folio_size(struct folio *folio)
> +{
> +	return folio_size(folio);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_folio_size);
> [...]
> +    pub fn size(&self) -> usize {
> +        // SAFETY: The folio is valid because the shared reference implies a non-zero refcount.
> +        unsafe { bindings::folio_size(self.0.get()) }
> +    }
>
> add:
>
> impl Folio {
> ...
>     pub fn order(&self) -> u8 {
> 	if (self.flags & (1 << PG_head))
> 	    self._flags_1 & 0xff
> 	else
> 	    0
>     }
>
>     pub fn size(&self) -> usize {
> 	bindings::PAGE_SIZE << self.order()
>     }
> }
>
> ... or have I misunderstood what is possible here?  My hope is that the
> compiler gets to "see through" the abstraction, which surely can't be
> done when there's a function call.

The build system and Rust compiler can inline and optimize across
function calls and languages when LTO is enabled. Some patches are
needed to make it work though.

BR Andreas
