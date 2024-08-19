Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B19E14AD3D
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 07:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724053036; cv=none; b=u+gCXW2QbHKyqy7WNgz5vF6+iYvqZxIFJqP39vwfSWJIN1bb1tOJAOkPNjBus0fDs3Nwzrltv7sBbrlFRqwJU/wfq83w4uThHcA8Q2IGMLkPuc6JtH9G6QL+ouq0QuFnsZjUhhvC86Nk5H5e9tqFAObu9FMfIvIggMhps6eDCBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724053036; c=relaxed/simple;
	bh=8R+HLMGC9DANB5Upwhp7nK70CFwhS9LHDQm2sVdKp9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YkJjGyShvXxD5deRegQaisv+R1gaQLCJdZdx9XmaP0OrPiOt9f/udbQx3lGeczy1nulJ5jhECX8LIKNrkSy4GdtGZxZFnKtuOrQdfSP7dLYHJ9qYUBqPa1HROMJLu6sdQu1IdwVFFk0vfwZbIFuiEeNL+gyHRy9C16cK9K053II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=owFl/To0; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="owFl/To0"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6b8d96aa4c3so8048627b3.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 00:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1724053033; x=1724657833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8R+HLMGC9DANB5Upwhp7nK70CFwhS9LHDQm2sVdKp9U=;
        b=owFl/To00VXWBCS5sSO28/PnMkDEwYUoEE+0RXhvj/0FNVUzabNnj5ZQ/sEoz6QF1J
         osUgDus9gLORI1PCTtpNExD9yFHXEjGn2V9hep9jiP9uyFdD0mE3HtbGbIuLhnhXs4i4
         aPVL+DY1MKjSwCxSLJe8dAXrdYJ3YXRb3cHKuvWfteT8ciE1dcc5GBo1vaNFkTOyKqvY
         aiv/J+oiYz4oh/G3nSJp81p/fu+/KbluXfCzHRLAaNKI58QZ1Rixt58N0iYnckQhq9PW
         paDORl/C2OU9T1EnH8c/m2z5jcJs4QpeFlTwnTYMl+WIvnaQPU5qjrt7m69rfoLQ2Gkf
         Gr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724053033; x=1724657833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8R+HLMGC9DANB5Upwhp7nK70CFwhS9LHDQm2sVdKp9U=;
        b=bzqchFULcDUlGTh51xVQRRtWi3jxkJeIv2UVEW5zAFowZ8phhkyNpQxm0UvQPIbkqe
         ZkaoWqqcvd1NbTnvfy2Y8XODeoVZNuDak0aEPnedMO6Z/8miT5lPbRYy0XpeeTFcjOJf
         BpPluUmBhc7JQhsx7eGl6JIn+Neqi9GV2IRrj8UYWHA3rWsz3Q9gNOvUKC1vw7M09DU3
         Ndk81UDGoIbf+8xBPjHJrZZZs5Txkb+BVaR/oLbfOVNcWqZWF7X6/nOtTG7w9dWPfRv1
         M3k4DrQWyaZOE8UUOwskQuYKllgEUelVLI0VcLyECEMVv1ZJ5WducVI6MVAW/dfZdCOq
         cB+g==
X-Forwarded-Encrypted: i=1; AJvYcCViHqwnc0W3cVtLmnxYitZXBe14Paz07yNZBd5p/dGatSP2zP2l4VWEf0jqT3gQXV1H3h/wVHpcMOjsCVAUykODVLeLYEWYhk/89eMoaxc=
X-Gm-Message-State: AOJu0YyAL94E9YfUXbrYyxmsKypBeeJLgk9YEYH0y11xNepI1Xt3ZJ6A
	VTe75dh4FrwNSmDJqf0s9XeoD+/AwI+Ekge4xQkj0iJLenKhqtViyUCODb2jS0FasMzj6hKdXbS
	U9fzdmuatMuRZczhAsOihKqL7vethMy7Eeq2jeA==
X-Google-Smtp-Source: AGHT+IFp7kZc51+IIezkIKw6qvUfXZ+YpkHllZrprtp0K/0BIXlAECx6uUl9oWabDPVcWKm5IL/NjaLLy/MJWc4bqhQ=
X-Received: by 2002:a05:690c:7013:b0:627:de70:f2f8 with SMTP id
 00721157ae682-6b1ba7e4845mr107827237b3.14.1724053033006; Mon, 19 Aug 2024
 00:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819005345.84255-1-fujita.tomonori@gmail.com> <20240819005345.84255-5-fujita.tomonori@gmail.com>
In-Reply-To: <20240819005345.84255-5-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 19 Aug 2024 02:37:02 -0500
Message-ID: <CALNs47tLDD2SQDeJ7h24Sakd6N244OXM8HvPsHQMds4XjwOTQw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 4/6] rust: net::phy unified read/write API for
 C22 and C45 registers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me, aliceryhl@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 8:01=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add the unified read/write API for C22 and C45 registers. The
> abstractions support access to only C22 registers now. Instead of
> adding read/write_c45 methods specifically for C45, a new reg module
> supports the unified API to access C22 and C45 registers with trait,
> by calling an appropriate phylib functions.
>
> Reviewed-by: Trevor Gross <tmgross@umich.edu>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---

If there winds up being another version, could you link the previous
chain for these two patches ([1]) in the cover letter? I knew it was
familiar but couldn't figure out where I had seen it before :)

[1]: https://lore.kernel.org/rust-for-linux/20240607052113.69026-1-fujita.t=
omonori@gmail.com/
