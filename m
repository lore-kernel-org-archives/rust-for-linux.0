Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA51ADF63
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Nov 2023 10:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="do9sAGK5"
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC8021BD4
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Nov 2023 02:25:24 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a7c97d5d5aso90555947b3.3
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Nov 2023 02:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699439124; x=1700043924; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fIAH7ULmpEPckNqECutwwAimtLz/dzVilEA+c10APxg=;
        b=do9sAGK5lQJS/QE6LEK0Li7YydhFzWqzWF95+6xGnOh4yuGy0GHB0EDQQgmivUrShr
         rPgUPAwjqGU/H4JQInCdEDvkaqC3TriKQG3iODiUBz0vMRxYh3PcFVjLRBwe/dwVVDgn
         pVMZZPsS5HgVCSbX3HsebvXP8MFsR0K4MvhwnnRKNrAksQBTABAyeSppiJRKOZt5huxL
         tcZuku9jt/5MxVIZAz8TDQEBDH8sRqLzu1t+q7I5Q7po4s/ISgotBzqTtLDN8RwgRk7/
         aoddngW4kPPeywTX1NTbWT5zG24LDj9ONOajhmw6U22rr5EoN438T10f90nR3eZbpLfi
         I4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699439124; x=1700043924;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fIAH7ULmpEPckNqECutwwAimtLz/dzVilEA+c10APxg=;
        b=GE4t3sQ7AxxU76HsQtFP5CrkVf6lk15r72TbrQNQ51UZDH5U+kFq/nw5L/EODmrOqo
         I18gVaBFFsEYVMUWTjIGwQmp0Y+q8j4xELJx0JDPXevK0D5p9j9yvl/1wiW3DE2Kaq4j
         uisNlKQ2IR2dIgpWyi+T6+eE0ArSJ6SP53v37BKZc5C0V+RmuFnh913fEnmMo7Oa4GsP
         qCcL/AvOKaa4s9ZlgzcDbg68FbwOGuxYIdEPUHycsTuAm4lOjnIbLMhMF624TH92GFqw
         zQGKejQo2WYRW/Id7uyfIPrwZJjH/vg6EAV40PRQFlj2Z6ulyON9G75FqC0lcDTsgg+A
         Bguw==
X-Gm-Message-State: AOJu0YxWGbyGLjmK5OCYicE7wc9prvsZ5H6QC4Q6flrvtazIA3/1zto/
	bCFqKUymtvV4Z3fh7Ona+RzkpXcOQKMN7Jw=
X-Google-Smtp-Source: AGHT+IGtZC0V8m4itDc/HxEmRCPbDkWdSXexw5klfcLaXoMbRICY+WuL310XErMoKd7j9oxQ3u+qc6g80fVGyeI=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:4712:b0:5be:a336:4a6 with SMTP
 id gz18-20020a05690c471200b005bea33604a6mr12477ywb.3.1699439123981; Wed, 08
 Nov 2023 02:25:23 -0800 (PST)
Date: Wed,  8 Nov 2023 10:25:21 +0000
In-Reply-To: <sRVdoCqLbxM1-EH0iKVlb9eOEU-wt410-WT5rFTQNNYgmiW6EEpKvCCJyVppOmFYhXBcCN3SsXUXULzpmmweYBGDVHW619pjsIZvorv8Fc8=@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <sRVdoCqLbxM1-EH0iKVlb9eOEU-wt410-WT5rFTQNNYgmiW6EEpKvCCJyVppOmFYhXBcCN3SsXUXULzpmmweYBGDVHW619pjsIZvorv8Fc8=@proton.me>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231108102521.523413-1-aliceryhl@google.com>
Subject: Re: [PATCH RFC 02/20] rust_binder: add binderfs support to Rust binder
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	arve@android.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	brauner@kernel.org, cmllamas@google.com, gary@garyguo.net, 
	gregkh@linuxfoundation.org, jeffv@google.com, joel@joelfernandes.org, 
	linux-kernel@vger.kernel.org, maco@android.com, mattgilbride@google.com, 
	mmaurer@google.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	surenb@google.com, tkjos@android.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"

Benno Lossin <benno.lossin@proton.me> writes:
> On 01.11.23 19:01, Alice Ryhl wrote:
>> +/// There is one context per binder file (/dev/binder, /dev/hwbinder, etc)
>> +#[pin_data]
>> +pub(crate) struct Context {
>> +    #[pin]
>> +    manager: Mutex<Manager>,
>> +    pub(crate) name: CString,
>> +    #[pin]
>> +    links: ListLinks,
>> +}
>> +
>> +kernel::list::impl_has_list_links! {
>> +    impl HasListLinks<0> for Context { self.links }
>> +}
>> +kernel::list::impl_list_arc_safe! {
>> +    impl ListArcSafe<0> for Context { untracked; }
>> +}
>> +kernel::list::impl_list_item! {
>> +    impl ListItem<0> for Context {
>> +        using ListLinks;
>> +    }
>> +}
> 
> I think at some point it would be worth introducing a derive macro that
> does this for us. So for example:
> 
>     #[pin_data]
>     #[derive(HasListLinks)]
>     pub(crate) struct Context {
>         #[pin]
>         manager: Mutex<Manager>,
>         pub(crate) name: CString,
>         #[pin]
>         #[links]
>         links: ListLinks,
>     }

Sure, it would be nice to improve the ergonomics of this. However, I
don't think it's that important either. The current solution is a bit
verbose, but good enough for me.

Alice

