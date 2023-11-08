Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32C612E4D
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Nov 2023 10:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TQAor+XE"
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D22791BE3
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Nov 2023 02:28:05 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d9b9aeb4962so8077474276.3
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Nov 2023 02:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699439285; x=1700044085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4dmEF9KgvpntqTBvjCTWhDldYUYFHQAMggDdqztH2Wc=;
        b=TQAor+XEv2LFsn339Lcs7LWSwQKyP7gnH2I/k09rWqFC5tNgCVgutBrxOj7scKiv9w
         +57TWEJqNPbnLwhGiFyBpwFAhk2DVwMNQodPplPFafvfToyM/94AS6YsLsPrDw4/NXy2
         GmNm8a+eHJkmhoFEKUbQJpXdCDVWiIsRA4yKWt4cMArG717yxVt7DixcI8RItr2Raltd
         95xXJeMVNKWYDzNciuwhG7fUZC7xqMUEzX9OVd/WU8wmJa3rvA0aALqJYH5R8TKsFFO+
         qZo4l0r7GjaL+ARHfdhLaVHB5Dn6fwDjOOK7HDsJJlzSuEypncYwtJRsvY9nFnD1qSGU
         GLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699439285; x=1700044085;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4dmEF9KgvpntqTBvjCTWhDldYUYFHQAMggDdqztH2Wc=;
        b=SYR4nmDIQG0ooF6St33g6K5pdyaptNRqZORgn3TRjQLsBsgDpeh5VOfSF3OgBfXM86
         IyImSoKIa8AsPLZrTTJtyv71rKtlOuX8OP1VreswrYyBTZgjNqbMn4rcucGChiNExiBm
         IZnLByM02uV5N5LRRMLcipKV2sFw5nY4hfNZZf5CYCvjERJcYn8Zx9fuMcRAHFmviol4
         B05s/egmVRFgudRI5V0SxO6T1ukluW4rfvqV4h+HYOiaL9FmjuWUj4u1tEb1TGY4w5jI
         LBIXTF20MW4LB1sc+9XUI0heyk1340xkLaDo6kc9hPdMIL0/NMzp+L/BX6pQEQY1eQ0a
         AQHg==
X-Gm-Message-State: AOJu0YwTCpBzds5Ox0jDHilqqYFjOEjzcUB6ti58gVTi+8RXfk+PX+AJ
	5xrKk4Fq8W17F9UB2N/D91JrxACNNM6Pe6I=
X-Google-Smtp-Source: AGHT+IHt5WjeCeluDG1SOFpGWvs5KwA+RL4PbrKOZxBxBzTct7ckZ/yTqt7rDoR7F4KiNF+lnIGbFLM9+gIveO0=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:292:b0:dae:292e:68de with SMTP
 id v18-20020a056902029200b00dae292e68demr22560ybh.6.1699439284903; Wed, 08
 Nov 2023 02:28:04 -0800 (PST)
Date: Wed,  8 Nov 2023 10:27:59 +0000
In-Reply-To: <62F430CC-9980-4779-9D43-7D561D322C9B@kloenk.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <62F430CC-9980-4779-9D43-7D561D322C9B@kloenk.de>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231108102802.524151-1-aliceryhl@google.com>
Subject: Re: [PATCH RFC 03/20] rust_binder: add threading support
From: Alice Ryhl <aliceryhl@google.com>
To: finn@kloenk.de
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	arve@android.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, brauner@kernel.org, cmllamas@google.com, 
	gary@garyguo.net, gregkh@linuxfoundation.org, jeffv@google.com, 
	joel@joelfernandes.org, linux-kernel@vger.kernel.org, maco@android.com, 
	mattgilbride@google.com, mmaurer@google.com, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, surenb@google.com, tkjos@android.com, 
	wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Finn Behrens <finn@kloenk.de> writes:
> On 1 Nov 2023, at 19:01, Alice Ryhl wrote:
>> diff --git a/drivers/android/error.rs b/drivers/android/error.rs
>> new file mode 100644
>> index 000000000000..41fc4347ab55
>> --- /dev/null
>> +++ b/drivers/android/error.rs
>> +
>> +impl core::fmt::Debug for BinderError {
>> +    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Resul=
t {
>> +        match self.reply {
>> +            BR_FAILED_REPLY =3D> match self.source.as_ref() {
>> +                Some(source) =3D> f
>> +                    .debug_struct("BR_FAILED_REPLY")
>> +                    .field("source", source)
>> +                    .finish(),
>> +                None =3D> f.pad("BR_FAILED_REPLY"),
>> +            },
>> +            BR_DEAD_REPLY =3D> f.pad("BR_DEAD_REPLY"),
>> +            BR_TRANSACTION_COMPLETE =3D> f.pad("BR_TRANSACTION_COMPLETE=
"),
>> +            _ =3D> f
>> +                .debug_struct("BinderError")
>> +                .field("reply", &self.reply)
>> +                .finish(),
>> +        }
>> +    }
>> +}
>=20
> Renaming the debug_struct itself feels like it will make it harder to
> find later, as I would expect that a debug implementation names the
> struct its from.
>=20
> Also this has the fallback in CamelCase and all defined cases as
> SCREAMING_SNAKE_CASE. Maybe rather in the defined cases something like
> f.debug_struct(=E2=80=98BinderError=E2=80=99).field(=E2=80=98reply=E2=80=
=99, =E2=80=9Cname=E2=80=9D)?

Yeah, you're right. I'll improve the debug formatting. Thanks for the
suggestion.

Alice

