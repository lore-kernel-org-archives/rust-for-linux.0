Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792489247;
	b=MuCCvYpCXQ9Gr+LQAJbZUzfjzE9NJ+oYUYgkpj9HJWzjr/vnsdpO4aHG4cgpGXOPM7mx
	 5ETyIEznRZuqqNBKYOv2gsZUDaINREi8YheESe607MbBzEPx8qmHY/SovkjHylN1IwBXt
	 ev1QMLKswIzWMTev/UTcmjVZyFC4Fi9b221EGK6bwO6V1aAYEDBZG0MsUFOZ7cT+wA5UF
	 X69cWzGplV1DEPvNZ0uGFc/pKo/JA1p2Cas7htJHYS8G+59RrWYq3m+UgpH+E4fMQ/hNQ
	 Vl3xMdKDp08DEnpNQZkNgp4qImkqyYnCJxolDDy2uCGXZmA+DsvD2yUIe84ABp2y5hA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aGDzBe9wSfOot1JNH8CfshOMHkOZ/rP5xat4GkGedRw=;
	b=OatepzaGQVe37tGxlsfZYKK9G0xTeHvJ/XvZfpoX0WdzSQjG2wkPDq/B9ll5BC6ymI7K
	 261uo46vPcaoO6sefLdUrU4T5VT8tg0J2yFL4EQTFejDZokVYi3vvDJfkfK2Ep0Y3uJnu
	 PdiW7DvsNQLd8rDJth5cQdhyukWdzKa9LkhVhng248vhGaBrJ2A1YcoP/+6IrylLan4Ly
	 m0n8bOgIGS4+CNkt8MCT4Go2ZOwfOvfEdGSRcElET+0BY4FKoQZqZDaGxfkmv9a7wviOl
	 EIwx8CPL+BHfL+7KgLJprFRHa0ROO+WszhZ1EIYYhyK2e6xJrPNXKi3v1MIzOJMcvqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="gG91j/Fh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ADE60A2605
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 09:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84ADE60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=gG91j/Fh
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1fa22006cso467535e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 02:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792489246; cv=none;
        d=google.com; s=arc-20260327;
        b=V9j5M9z1RMHbXU91G53+HOGSQX+UJdMUwh6+9CKWKjg+uiO78qL9o6x5ocyi419zXH
         XwWYm94m5mRcs+ASFL974TxUMx+gKUS3VEXAod/g0QnKgZDrgVmwJCl1sCoLRs/bXW0V
         E1PsCxbzGdGvA6tgAHyZPFSAZ1WXY5TJOCHj2zx0pi0CXTBsbddFRKHHh6pptSkcNO3o
         DkxhlNyW+4UcKzTHJDOur/6G46DpE7oiBwuJtsnivvqHK3UWR8ErEVqTrV0YFp8gpO/A
         pyy6jCHB7PAlwjaOrFhJJq7YLTQTxgxGZWqOPUsBWTFQBQe3aFFpYxfJOkKNRv4uWIbM
         6Gsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aGDzBe9wSfOot1JNH8CfshOMHkOZ/rP5xat4GkGedRw=;
        fh=QsOcJ4u/ivipeBmqPLd8AgRa4q1/NyOJ3fgcuc1Rl9Y=;
        b=gTZfhFerbtMn98oBc4HM2pw1U8YByAzNNCd+WiUKSAWgiU4laO8bb9OShAdlpO+hv6
         /snJf8hqERmlvqH1K2fRYGcHGH+0pmm3rb6b2FSdHYo4wIuC4R+t/kf2UCvGiJog6UuD
         bQ2lOry7XkGA1o12bMpL0PSHk9cq5KCGpa/CjVBMPndLhplYfa07jyM87RZbmeCBY87u
         /DN/JCf9bhX22psYBCMmEoMoq77+szxVp+fpIAc0OevJ2ygORbkf2tnbYdrbt5x8StK1
         /7L//j2uHail26ZM4UF80GN8Uo+p93AS8t/5MKRXicneJ+J1rAeGvFbXO6eg53nNsR4m
         ZimA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792489246; x=1793094046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aGDzBe9wSfOot1JNH8CfshOMHkOZ/rP5xat4GkGedRw=;
        b=gG91j/FhXglb0AljTZi+SztoO7prTJ1Kped+u9wquVXS6rrw5nR3KY7eDXhjJjYMaV
         /bHGrTDsBkUfp6sUWh+QQOo7IqFsjLmT4OcY7hY1dJUSwIGu636c4vLCw2UjMm10259O
         GEdX+Gga4FYJVKtlPHWUOj2Kw5haJsOaO5Ij7ptYnGbyGPJyDb5rKS1JfkskopCSB97i
         oJtcDuI4HW1sqQ1Qogvgy36ry3XPb581DX6c5LQNHFs/TQ3dYfpTrogXj8cVm9h31AED
         I5W381ue/hLcEEJ0Tg9/ta9Ht+a03o4bkzyIMum2NCJPiz700y+CzDvl96W6wBMc4y8b
         mu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792489246; x=1793094046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGDzBe9wSfOot1JNH8CfshOMHkOZ/rP5xat4GkGedRw=;
        b=Ty8jYtsZ2N+rbEUw6D2dmBk27/sMTI+/6BgiQjF43lhPQwl2Rph3fV9tcLcmg68xkR
         OWPym7LElQropC12vJhrY61e3bNk7KaKuXYL7x0ZGfVaIkH9VPnLRD8PTRjZAobMPrDu
         layCS6Mm5Ip06h/uEbHn8mBHHG7Q5epqeCi/wdT6U0xdTAOPRO8ayETwt1r1rjCMrw5h
         46syELukTfkD8+hoUWuL0at2Uj4zpkLExN0eCYtgnroz+1q7Is5fnc0HKElgbb6rKwBs
         K9vexgTNbI6eAKVGP4X/L7tf80gXpRkvD/z+LUonhkaVlI36ESYmcWqayKrPKxJwc4D1
         D7zA==
X-Forwarded-Encrypted: i=1; AKwUvByo/tQuUYEMNdcmt8KQ2LKwBCfc8Un/oAnibpqqtuLCB3CAg83OaZUy9735AX3FGtKFOsBLDcFeFAGgLFwCaQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLrF1KBxfxVBlHhHtp42b4q5Me+15XfK4/Ihslw06eVkrk0v2YQ
	aWypJjOFDuXAirJfr9e1pYdxhKIz0HzNV+db3hmuiq3hMiPQJujGIc2MqL1BljRf8xEtaw2rN69
	D4xP7XKvade2Z0PWq+G6KPoR6KVa6Yj8ad+KfFu3E
X-Gm-Gg: AYBFou3JPVHGM7AnrUW1dZ7lTs3kl5XIsRWsbKEXnVB7a9HahSk7JDyoyPMsj/2zn5A
	0SCTAU5vO1+aFM7sVxT8v6B7kGBe9odnCVy93etCOLaJJntmb8uOdpqSgSJhU4Zp+3qTzWUE5dt
	HvtgMXGZHOt9RvaQ3O8hcf8t19EXE5bvTAn2rgT2GisBKsaZzAcRd+uQkmdxTJS4JRm12MwNRmT
	2hzx0OsPE9Vg1GuAvpMaN/ABOfSZOHB8zofB2JohdXY1rKXvrXeyEyQy7SsL/996M74fXrNdiFM
	DzZ8XGuTxTKo2EjPFrn4oYOb+1uuio84GH9nvKXpdq154PeLdJlf3jKo8SjJ5LXIooE9Ki+QA8M
	j5FnogsoX2MR5Vln1imv8
X-Received: by 2002:a05:600c:c090:b0:4a1:702f:c736 with SMTP id
 5b1f17b1804b1-4a1d75af24bmr181205285e9.3.1792489245370; Tue, 20 Oct 2026
 02:40:45 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-fwctl-cfi-encoding-v1-1-ebb30d1500df@google.com>
 <20261020115534.1134f2b3@inno-dell> <CAH5fLgj6oCjVheVLYu+X=ptFA-+x4cznX1+bgWT3ayndiA6eiw@mail.gmail.com>
 <20261020120852.6d2ff11b@inno-dell>
In-Reply-To: <20261020120852.6d2ff11b@inno-dell>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 20 Oct 2026 11:40:33 +0200
X-Gm-Features: AclHuK9BrUjMuF23vOzcGkpwaIs37hezkcv9StlIIIkbNAypoyvDRfKJpnSfuq4
Message-ID: <CAH5fLggw3afkFQW-5NM9MqCqCtTPu-Na0GZYsx94MV1=P8YJ0Q@mail.gmail.com>
Subject: Re: [PATCH] rust: fwctl: declare cfi_encoding for fwctl_rpc_scope
To: Zhi Wang <zhiw@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Dave Jiang <dave.jiang@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Saeed Mahameed <saeedm@nvidia.com>, 
	Jonathan Cameron <jic23@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 11:09=E2=80=AFAM Zhi Wang <zhiw@nvidia.com> wrote:
>
> On Tue, 20 Oct 2026 11:04:43 +0200
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Tue, Oct 20, 2026 at 10:56=E2=80=AFAM Zhi Wang <zhiw@nvidia.com> wro=
te:
> > >
> > > On Tue, 20 Oct 2026 08:28:37 +0000
> > > Alice Ryhl <aliceryhl@google.com> wrote:
> > >
> > > > Currently, VTable::fw_rpc_callback() takes scope as a u32,
> > > > whereas C calls fwctl_ops::fw_rpc with enum fwctl_rpc_scope. With
> > > > kCFI enabled, enum types are encoded distinctly from integers,
> > > > causing every fw_rpc indirect call into a Rust fwctl driver to
> > > > trip a CFI failure. Thus, generate fwctl_rpc_scope as a newtype
> > > > with a cfi_encoding attribute and use it in fw_rpc_callback().
> > > >
> > >
> > > Thanks for the fix. Looks good to me.
> > >
> > > Reviewed-by: Zhi Wang <zhiw@nvidia.com>
> > >
> > > BTW: I saw this =E2=80=9Clru_status=E2=80=9D needs the same treatment=
, guess bindgen
> > > will someday automatically handle this?
> >
> > I believe lru_status is already handled.
> >
>
> Yes, lru_status is already handled.
>
> I meant that both lru_status and fwctl_rpc_scope need explicit entries
> in rust/bindgen_parameters. I was wondering whether there are plans for
> bindgen to generate the newtype and matching CFI encoding automatically
> for enums used in function-pointer signatures, so future additions
> wouldn't need the same manual setup.

That would be nice, but I'm not aware of anyone working on it.

Alice
