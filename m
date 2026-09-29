Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7463A257C
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 18:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790706634; cv=pass; b=kRNcTVg1JvzIgyWFg4Nc6Go8ObKEgFILcyKQ2wiWd+XyEtDjgEK8ZYtQQT5e+vNOCusiWY7fxvEQ5XcaslBPgAeuRMTx7c0mG1r5lu1pGJYK8EWOoO8m71J6pv4bGFqbj+6oNRCkMOSHLEM2HRgPLJR5Mu27G6KpkPftAbItvCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790706634; c=relaxed/simple;
	bh=so6oVerSAvlf8qQyygVkuGfJwEoQL40QCmwAvKJBtHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ax6J43WmNpPeDE3TY0IyhIF+F/UQciV6lkr9+zG/OQziUXwTpitzpfnykJ9aHslMdUNYRGm9/4/Q0TP7SL1j7adjHS9rnmpl4pX30661wDAJw0PVMyxiE+QP++kxbU6adnny8rB3r6Cz8neCpW1sSF4eYN+n392S6itLFJo9AsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akVseL+2; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akVseL+2"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bc6ff6cadso612096eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 11:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790706633; cv=none;
        d=google.com; s=arc-20260327;
        b=h6VrpDcVo6VvUYZRLH0zFfGZAZcAeWowh8BrABsZu7t9TOO9feFDpRfGRIucxgiJ4Z
         dV+pOs4Zbyxoy0mWoq0XJxM37CvbUhJ0mrQa11dkuyrTz64UsbHp6WyU+3qSO9jWKNlL
         MaCopSwFg0AHAgkk0Iscv36HvoV2X5tO02WszvjQqfFH5nUSGhfIVp89DBcHX+jrRFn7
         h5oc72dVrCR8UWowcMHBItegyPOsc6KYI1Qm1uEcjS2Y6EGBwd3R2b803CB/LlrnwMG5
         FCTrvQYvDZEKQoaFodrzUnr7bL0ohxUMn/hPjiNcSiRPtxma7MfasB3G8Gz8KT1jB/2W
         rNFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=so6oVerSAvlf8qQyygVkuGfJwEoQL40QCmwAvKJBtHo=;
        fh=p+zG6Q4NvBf8jpNLOO6zFlPlZo+pEJkxqYbMVAAHFqY=;
        b=R3EA0FNR9SpKlkT39PNCQZRuIIZAJTb8nPu5VN8vKSdqVEZRTeLpoK7rIXMd6aAFzh
         MAtYVZwSMjChS13UnsbqEF0KyU4zX9t7H5lAAucGhs0mkbyaBU1sPeqoPK0DB0yhHeys
         OVyy1HPsPXZeA/LX+RB8FN4pcvgFUmlUrqXZF0KNDaqVjwSZw3sEpoWezleIwA7buVnd
         GRpryHjKqmkZYPXbjuK2ayhHm1bi7oOC9vH/2/yQRORanZEctVANx7Y44tHD25eF6/1l
         B2nYPU4dW9yZidT6eh7+e2eVmqbCSO7wx1iXdqQ4tAm0DnWBrt9pWqlnFlZQ5bx1XeS5
         zALg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790706633; x=1791311433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=so6oVerSAvlf8qQyygVkuGfJwEoQL40QCmwAvKJBtHo=;
        b=akVseL+2Zsw75iD0d1oqrP0APaGwmGn+q4fHtfrhpUTT2nPQtaRxaXwzjfTppmbwEL
         nHa+X+mMhmtr13qN9AHS0xC01gLZMtQE7AUvSV0asif5xU38rcWhyo7QBswnEYBJIuBs
         C5jUtRkLrzNnHWZph3koqFyvR/ME3NBeA/9OFGMQAo30w8je3nz81K1U7NWVbNxRghlP
         AWYQY9xMjkzeFLVT2TsM0qVbWJ5JTBuoNS3HP9clu2aEXN5hp7zSzWNgybybFhB2gwLh
         uPAOSR4P1/kE0h1CHW14sVgDvjT32CCXyhXN8pfWhK9kfB/T9Ch0ppr9x8OGCAYrJMy0
         0LLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790706633; x=1791311433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=so6oVerSAvlf8qQyygVkuGfJwEoQL40QCmwAvKJBtHo=;
        b=o+tjemL8mQnGdtfMjvj9EuY/TNlgCDq+FxSaRrdExFk02796Rh6VyKOKkjIG7ZTahU
         lhQUQOQX5uU/Db8XfzEdKaZTzFzChimJt6ga4n0OW7TwEFcn6JT6DtUa955Lur7FrnRV
         +uaSdzNDCkjxIBURJmkLIBwWS6etbBiRmPT14K4yTnO9/Gc7kxxJo+G7h7ddfRAaPA1a
         SSeM9dPXXKwZ3SQN+7oJi8NVWH0foduE06bYspp1mOEG9we+i6NjxXIOT82z8boiF6nl
         rQ/bLgi6UpUVE56JdLSYKFcs6bEhGhaXKdmwa9ZPwtg69y7aPY2GXxLAshkz8B3g4PhU
         gqQg==
X-Forwarded-Encrypted: i=1; AKwUvBwzgaYBwBR4dTNwSU6mo6Arlhse3acv0O3CHltdzFz0zjNo7aC8w/UrVqsq2xJhFvXWnCvw9lDmfYEX9+czDA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIMwOsMoUnIswEXI6ie0V9TP3H0MCUt5IrNPMgLTdjEbuP6OMMK
	YGCr4YyFa0GP2gmsL2Ueq5EbEeQc0CaIZqQRuTLKllZcRbXa2Yu5lo84GDf9hQJg+MSDRsGEzKm
	lG/d02vCgKEVslu/Y0D+1YR8mZpr0CpU=
X-Gm-Gg: AYBFou3Y7J9EbO7SG5LAebgmk0wFgqxZDXvBaNBF/lSy+kujfKzR4BrAImjO30NO3go
	mjvdyQV6zrvWBoO2BxyD1fxK2KbiSY6wgqTmXZeOE2PA+Cx6srcFi3MgoIXAdXs7aowy0jWiHvK
	zD3j4aajeVo+cC1ztu8Z5kPBJ3WhBVew4vlXNuaNeX15BZyIsTZRmyBPLmgrPJOwGO7t4b2EthO
	y4hofDpqo5JsKoy3lkWX3IzqYfvgRK/Wjd/0r3bSBdNcOpAauR4CoPNMBAtjvSG8yJPAbHzks1x
	oaMEI6UTQ6DyyRBA8bdLvq2TyHySEg8+LlOjLT7fqgFtgAX3sd5Q8cFgZaj2Z7nF+NnKCwRR3z9
	Xx9aKvOuz9QZ6pG0jGRXR/2AtS1OtCFo5DqvONp98FM81rGYHcMwiJFj3v++bc8+72BJAdeFS9s
	3zON2acOrBYjRXnywSYsWtpoPIfe15hid3IxTIbC4cZSgqnhhCnqE=
X-Received: by 2002:a05:7300:54c3:b0:340:f698:fd56 with SMTP id
 5a478bee46e88-34c65e57c85mr310321eec.2.1790706632561; Tue, 29 Sep 2026
 11:30:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org> <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org>
In-Reply-To: <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 20:30:19 +0200
X-Gm-Features: AclHuK82YPGh1_8MznSyzg_lIm_Mo3ik3GH7f918U02c_TAEwv_vWlnTK-O3zyI
Message-ID: <CANiq72k-_LX5GVSKWQQ5EJV25GDfXOhOebv3TLqdA63tQHNd-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus` C function
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 7:58=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> This function returns the maximum number of CPUs that can be online.
>
> The wrapper is needed by the Rust null block driver.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

I can pick this one -- it could have been an independent patch anyway, no?

Thanks!

Cheers,
Miguel
