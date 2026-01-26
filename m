Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB5421FF2E
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 02:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769393394; cv=pass; b=rNnyWjnpSWCahz2mgMiAdCINHuKnbgHdEZbJV0nOTFRO2M0LnPnFHnQ5YRC+L261Z7vR5bB30DlxRuUe9mu0xImHBFwAqlQA59sVf7ocNoPGiEopcEXUVVZjeSW/B84yGGAYHOlldW5qDRT6SpRRRNvP2kG9Vg/9gdXdR4yWJ/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769393394; c=relaxed/simple;
	bh=lXUI+k5wQ5a7GPnYd6Nwa5Oc8r73Dh5oLetiGPMWw2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KiS5SQSwn1KatfYK4xq29aSqFsLxH7DRnByQnJyzTLOdqSj9+MdrSSbAhiK1hjVZGlOVeS2Jg/0HMMEfurXNV59c+o4zOlXKkpqrfGJM6BeFjWqOWY87T16au7sD4GPQAb5QHpJSpgZvPqOLsyr8nI2iRGqHpq/vbQsSppG0qdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPlAVJWs; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPlAVJWs"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b71310e8ddso125897eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 18:09:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769393391; cv=none;
        d=google.com; s=arc-20240605;
        b=RxYg+HF/f4Ki35b4Vfj1nC3KT3dVfDyKsSSZQsvkS5F7rlB2AEFwqlIU3xOLN78QC9
         FRjuhNfLMy/NqMB3HGKsh92QMiZFT+Xbi3Zot5LH8BiHdL0wI6Fmgt38GNNF3VnIl431
         eBxubE3RqXculFIy3NNJ33Vnxd7E2sIFUE7n1z8EpNhTEjhrFX+cnaaAkO2VBa1pYbwT
         B+unq5TGYUoL3IwmAjnNtUoMgBtX8euaOiTr0Ip8ctvEtkW8J7wg8vtffm4oTWLy9CCu
         YhtQVzfDZaCq4AvbvSPXEA7x+HHzIJwzAO7I5JaUGB3PBIGRj/aoC+j4ktHYOzDJz1g2
         m5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lXUI+k5wQ5a7GPnYd6Nwa5Oc8r73Dh5oLetiGPMWw2E=;
        fh=3iK4HSiId+rJWrbrX48c8c//AXzRgnuDbZXJVdI81aA=;
        b=A10psVf1nCL4Cbl2whP/C7F6lAjGCHRVxD2PlIQq9JkksW80JpjIToOXBmwsBqGVew
         m/BqU7UMypSME1Z15Sd1GMjf1p6NwT7K3MqBp7gasI8ujgMuKyd43I4YWEgYWCvPB5Ud
         XLLKUtxwcf8DDyULaMvBsTymd8VmzcEMb6Gg0obgkcmmStIqpTpiLOCZE8u42Cwhr3hD
         vjiL+6zbz53D6y/fRIl6OvDXXdteSC6VZSpKy2828uILw5bCpBKk9cDAJbTkUyfmAN+A
         ACt6bXHOFmpmrGvA5g/UYSWZjXzN3NLX+LjMT3GqtQqGtv20OyM2pJ6w31xVAXcrrxRH
         XRkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769393391; x=1769998191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXUI+k5wQ5a7GPnYd6Nwa5Oc8r73Dh5oLetiGPMWw2E=;
        b=JPlAVJWskNY3gDOKvmhLN7VadCKpza2M+nnv1xugkSP8ymA4W1owWUga4KczPk7Hfk
         TsrN69lPI0NF8fHrEKFHjKz+QZyn95j6ZEC+zfcTiDgzq9QnlE6teaTJ/B3AsLq6iU/V
         r2/zbJoLPowtmTqykPVD9VIG3oUJOqTlTGgWO/tXigW/FcSzCQZsBqCdtTf9giOP0ZGj
         QF3GTTgkh1IUeszidk1YgBCR7WbV5jWZjU0XkyF8J5VFWYhGTXQLcDlXyhB/qj0J6s5C
         PbLizjgZfhM4uRH0Saj2Kqg+HmUKa1gHrHxwtJwDNc5FOX06cdW5GYJAj0+VAqDce0fu
         tlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769393391; x=1769998191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXUI+k5wQ5a7GPnYd6Nwa5Oc8r73Dh5oLetiGPMWw2E=;
        b=WQHnQt6FN4tycsXXVPk0+y6Qzgv/X7PACt9ZTlO7SUccJ6VBkTAyfWKwd9J7EEjvEI
         MEytPganeowaaXVcP2YCq/y4VvCDlBo9A81HCLNwRcQ8pUNFUvk+1O7HU0yFxswCMEF6
         E+5Kq/OK2kpaRt5VyJTNoo3i9v/QQ5xylsLWQRdhCAmcwGRS027k5wG/H1THGHHJ+LxW
         ryCN7NwX248HBY1+ZxKWTESUdWv+NLBvjbDHZUbhE2fV5XqD+p+hyHksVp90tLc1nu4K
         I5mHtQkh5V8X6YyExUEQOCYpl2i6Uva/EaMdYYjRjWAPoSmncI8rJHZR1iq6/McsI5v6
         GAHA==
X-Forwarded-Encrypted: i=1; AJvYcCXHppcKrWTVOIqxsnJ0ZFIVeBnkHw4KUUZe9t5sJZ+7gS0Q6asZfa+PCGDZ/co9c3T5MKUS14QyAPujizTZUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc8aL+MN++tu+cWDV7Cqf8uyAV/kVytSeYHzEmthjM4kPL60Rd
	09LE3h0P0KNNp5+Uhp58+5DZJ1HMAgNHsvr2LGO0NYsa9Znf1gzJcnzIrNDTsnX54ZZ9ENLueLL
	vITD26O5gVATNs16GcplIsN3xEDOb1M4=
X-Gm-Gg: AZuq6aLuuE3OE9TbQizbcUxXZ5CeD22ZVttkikYNXCULrv8Rb/JfNo6+2sluGmI8FPy
	UD2G6ZTya6zb+je3KD8qnR0D1EprCuzjr5nseFTfd/kr3Phn+hCyGzxRhK39MXyF83gF3tq3RNY
	KfWKGv686DDQgEvO8AKbS5wx1o0SlDfxFeUjrMNNBbAOtvqqGWpbkT+rgnarpUcQ5I1PZWZAGlk
	cmG7xeE+VDb51dCcA/ZCKEoP+wuAs4dUn4Rn/cCLDDUZ6Id0oxx3vYblV/oz1/dwOsruWF2OWmY
	2FA9hJgaSUDCLFKA4QT0FbwKu9nKEXf41P6xcWdDLnRaTEv/VJFDYn+lISZ9NYQGPCOX6qgfqzS
	ZB3OUAdsuESMznQfh9Clj+nc=
X-Received: by 2002:a05:7300:4309:b0:2b7:121a:99f with SMTP id
 5a478bee46e88-2b764154191mr724382eec.0.1769393391065; Sun, 25 Jan 2026
 18:09:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-rust-analyzer-fd-leak-v1-1-945577813b20@kernel.org>
In-Reply-To: <20260122-rust-analyzer-fd-leak-v1-1-945577813b20@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 03:09:38 +0100
X-Gm-Features: AZwV_QjR7P_1yy5HgeZ8uLeqmpPnBZ8hrr0Jne8Ya2pgOpAyWay8I_JzCc7eaKo
Message-ID: <CANiq72=+2s48M5imZ7tZj-0SN==f_mLmw_2cWfQYKtBhD1ROCA@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: avoid FD leak
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 5:44=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Use a context manager to avoid leaking file descriptors.

This may have been intentionally written like that for simplicity,
since I think CPython closes them immediately in practice even if it
does not guarantee it (and I think the kernel may be assuming CPython
given the version requirement?).

Nevertheless, it is better to be explicit and proper, but it is not
urgent, so I would say let's put this in rust-analyzer after the merge
window even if you end up considering it a fix.

Like in the other one, I don't see the Tested-by from Daniel, so I
would suggest taking the chance to double-check that meanwhile too.

Thanks!

Cheers,
Miguel
