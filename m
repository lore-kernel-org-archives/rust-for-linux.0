Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TMeN+1N/"
Received: from mail-lj1-x24a.google.com (mail-lj1-x24a.google.com [IPv6:2a00:1450:4864:20::24a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA8AB2
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Dec 2023 03:02:49 -0800 (PST)
Received: by mail-lj1-x24a.google.com with SMTP id 38308e7fff4ca-2cb2ca46c2cso23104861fa.0
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Dec 2023 03:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702465367; x=1703070167; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wF8JoHNULRLQuvkLOWSPJJbTKCRhS7xnLTzqlYvSs1g=;
        b=TMeN+1N/ZauI5KZf61b3oHUXaDJqbktHfTdUC5kh6SdT1BOtnxHFjcIVlAryO9meS6
         O4xMnR2KEFnp5XSrpek2R2J6I4/Xxc1DDbUlyoFQS2mYcnCORUEuU1nOsNwuZqAbKRXN
         Tvz6ZVsxcveRIVLQP/4sCRHtXBoGdHODMLJ3X5dubCzsIbqfb9fE74PS2lqTRyeUw7R7
         ECwPiDhq9PTiz2UlNx9lg/w3spCLAMPDM49iN2O+aB3Kj5sbZ4FpOhO47OYNSaZdFKpw
         zVwiL4Rhab5yH0UDfiOrTnao4o/nZ5lWNArn2MYqZ0dOrIFIu1BPJe7cgRrsmir+2pSA
         1XfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702465367; x=1703070167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wF8JoHNULRLQuvkLOWSPJJbTKCRhS7xnLTzqlYvSs1g=;
        b=tatclYCYGrbd7F/dsPQ926ubWqchYXVY3Of5VIwDM8Z8l++Xa/GL4FOuv992iDnp9S
         9tbyz6bus8wnzHV40dzOGL51l1ORem10TkiDYt6fdz7DEBAiNnV/6r6M/IsDwY5m9oOE
         DQ5VTnX1wNSxGs9UpGglED5SRDl64DTSp8GMAd/iEeEby/lkI82xEFzBY0DxKdwwkArz
         DcR7zfdbdnXAdR4C9Qnk3ZRug3Q1/vC6TZTAnEBla5/DoIvIJluwM/1KCEBc755ueYT4
         pkGsZunDA7cx+BAel5vKspRDXRPKrfug2wDv1zdkiYtJzSyVvROwLUqpwrDQ9RpfBmsn
         aHRw==
X-Gm-Message-State: AOJu0YxHlwWeBiNzrzJEp+4Yaig9JB8SObMN/e/V8sbsitAqImCQagN1
	8rcQUQesm2njPg25wwmjRkfBCT5quaS9w8I=
X-Google-Smtp-Source: AGHT+IG8r/n61eq7vzq1h7EddFgGLqT69C2TTHTuuwMHQzYKsTazngtWEvA6k0fmgGuhq8lXkQ0iXrRHMRNxYbs=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a2e:9c8e:0:b0:2c9:f93d:994b with SMTP id
 x14-20020a2e9c8e000000b002c9f93d994bmr127544lji.4.1702465366826; Wed, 13 Dec
 2023 03:02:46 -0800 (PST)
Date: Wed, 13 Dec 2023 11:02:44 +0000
In-Reply-To: <E-jdYd0FVvs15f_pEC0Fo6k2DByCDEQoh_Ux9P9ldmC-otCvUfQghkJOUkiAi8gDI8J47wAaDe56XYC5NiJhuohyhIklGAWMvv9v1qi6yYM=@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <E-jdYd0FVvs15f_pEC0Fo6k2DByCDEQoh_Ux9P9ldmC-otCvUfQghkJOUkiAi8gDI8J47wAaDe56XYC5NiJhuohyhIklGAWMvv9v1qi6yYM=@proton.me>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231213110244.446502-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 7/7] rust: file: add abstraction for `poll_table`
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	arve@android.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	brauner@kernel.org, cmllamas@google.com, dan.j.williams@intel.com, 
	dxu@dxuuu.xyz, gary@garyguo.net, gregkh@linuxfoundation.org, 
	joel@joelfernandes.org, keescook@chromium.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maco@android.com, ojeda@kernel.org, 
	peterz@infradead.org, rust-for-linux@vger.kernel.org, surenb@google.com, 
	tglx@linutronix.de, tkjos@android.com, viro@zeniv.linux.org.uk, 
	wedsonaf@gmail.com, willy@infradead.org
Content-Type: text/plain; charset="utf-8"

Benno Lossin <benno.lossin@proton.me> writes:
>>>> +#[pinned_drop]
>>>> +impl PinnedDrop for PollCondVar {
>>>> +    fn drop(self: Pin<&mut Self>) {
>>>> +        // Clear anything registered using `register_wait`.
>>>> +        //
>>>> +        // SAFETY: The pointer points at a valid wait list.
>>>
>>> I was a bit confused by "wait list", since the C type is named
>>> `wait_queue_head`, maybe just use the type name?
>> 
>> I will update all instances of "wait list" to "wait_queue_head". It's
>> because I incorrectly remembered the C type name to be "wait_list".
> 
> Maybe we should also change the name of the field on `CondVar`?
> 
> If you guys agree, I can open a good-first-issue, since it is a very
> simple change.

I think that change is fine, but let's not add it to this patchset,
since it would need to be an eight patch. I'll let you open an issue for
it.

Alice
