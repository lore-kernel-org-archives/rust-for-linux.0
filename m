Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5081A0BC0
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Nov 2024 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732804869; cv=none; b=fCP9TlhaYAIDOleNQfOehb0R6LSXBDQZs7S7WWKqrJpxisCmagGXtyeG2e49RM9QJFXhrDhrmYI/597bKDn7ZM/gzgiZFeslw1Gc4UvhmhUDi1qSi7h57GWQvXu6TcJ/JFisGdtOX6SeIa5mU34E8bWXAJWq7Y3dr5ATSCMe3iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732804869; c=relaxed/simple;
	bh=tdMDYqpf3IuC59bE6nkIkaoxj2BSW7f0BxFAiJEyjlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+BM6rQ26x5QC3mAentTijgwI+9bl9KoGRjlbW9vh3TwwWbHdUGa1tkrBpcbdd5TaFAWCCVDu2OUC4Cg9gRUT9FAs7qk9iL9qvZa5iCNKHUDbiuUiOfHYSohyYuAx7jw4ursXLJJCuMzF7FRKti73v1OwG6Kkz61c4lS+iincfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=27CrapXO; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="27CrapXO"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38241435528so422455f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Nov 2024 06:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732804866; x=1733409666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwBwmc6DwE9wExuP36Thcn5CpMbyaudiqRqKVp5a+jc=;
        b=27CrapXOqkaBfuZRrAu8l9NPup+xksoPBwUXWGSu60+bhJVeJF7U9MAx4tQE1k0pgU
         5++puM0KW2kLGPU/djTnvQWPPvpTb8Qo2fz+q9aBTxe9hyJxdg9DwhZcJ8GH/H53C9j8
         Uv4qtbLLHo1A7wtRlJ94Kjr2jEAuqTqT88kje4cj8XB1sa8uJ6qPQRBbXHyPTl0AWZFW
         Y7mJ5hUnhgroeMwkaQGVFflM5Pna5++AOIBlwDQEJrTDqUYz7h9cM7OWMzAS74PUncWT
         txQwtIKL8ydUhTeM/2+oIRU45ZYrEzRI8tLwPcDPp33rLdRTYXvcFvBz3a/l3ycOTg9H
         dtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732804866; x=1733409666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwBwmc6DwE9wExuP36Thcn5CpMbyaudiqRqKVp5a+jc=;
        b=vroXV7Z1c2BdO/a6ukQJ4FFiqpsMB75jG2jRO4UqAKqhSQMDsUlmE/P/ewYISAvzl+
         /+UuRsuSwDVZGxMsqjhI1+miuQFMmR+/42K2Wm5PKstr6MeF2dd/G6FJJkzJsCKRWGNp
         1SlZSGmTDjlQ61MVy6mMC3YOaCwW+ExeZnFyEjHGYkU7GG4Txb+ZF8kDFFRZCBmMR8zg
         BFk2mj4GgZzqeA0MJ3AVNNbJIESa2PW2VobDeF49kiK55cRa/2kwaQ8BnqrGxq73e+9F
         3azvJEX4y13WaWSj7A+e/qSPwKxqE0MMvPGkfS0nS7m1L6ztgPKXz9ivuGI9SlFAApIL
         7Ybg==
X-Gm-Message-State: AOJu0Yz62MIvhEvHDCFOLAgATVgvoRvIH05fxRnf24f22PTvbPDplgG9
	BU3TG8e6q/2hnF8W4lePyH2VTMZNVOAlqtOcE34xGDO/tffGq7E8/04GInrYMLQ+pszIJBX5ifZ
	+UFAIqIjM51SyLMT7uZd6l9CsC6JWmXSM2+2r
X-Gm-Gg: ASbGnctT65Wg6b4hoZcwP7vGoP/+if1LTK0f67qZGz5KiqDlrZClgiQsBLMA+FESAOt
	f4FRCb89vr0crmQRacjlQ2X/Sb0FB5BTRNdEpxuXHFSzpG6w114oYZ/LPQBij
X-Google-Smtp-Source: AGHT+IGQuu3FpJRv1GRJAM93QH1pl0e2+J9DOMDr5xMd1RLfVGwI0OX1F/tLzRv0A5j1Ykw3kEo2peafOSkPqXsMNvw=
X-Received: by 2002:a05:6000:389:b0:382:5016:fd0b with SMTP id
 ffacd0b85a97d-385c6ee2190mr6139158f8f.50.1732804866470; Thu, 28 Nov 2024
 06:41:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128141323.481033-1-pbonzini@redhat.com> <20241128141323.481033-2-pbonzini@redhat.com>
In-Reply-To: <20241128141323.481033-2-pbonzini@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 28 Nov 2024 15:40:54 +0100
Message-ID: <CAH5fLgjJbzAbf5CO3xjHxcThpqju3j0tNdo+QiGupARVmoThYw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: Zeroable: allow struct update syntax outside
 init macros
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	boqun.feng@gmail.com, ojeda@kernel.org, benno.lossin@proton.me, 
	axboe@kernel.dk, tmgross@umich.edu, bjorn3_gh@protonmail.com, 
	gary@garyguo.net, alex.gaynor@gmail.com, a.hindborg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 3:13=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> The Zeroable trait is a marker trait, even though the various init macros
> use a "fake" struct update syntax.  Sometimes, such a struct update
> syntax can be useful even outside the init macros.  Add an associated
> const that returns an all-zero instance of a Zeroable type.
>
> The exact syntax used by the init macros cannot be reproduced without
> forgoing the ability to use Zeroable::ZERO in const context.  However,
> it might not be a good idea to add a fn zeroed() inside the
> Zeroable trait, to avoid confusion with the init::zeroed() function
> and because Zeroable::ZERO is unrelated to the Init and PinInit
> traits.  In other words, let's treat this difference as a
> feature rather than a bug.
>
> The definition of the ZERO constant requires adding a Sized boundary, but
> this is not a problem either because neither slices nor trait objects
> are zeroable.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Slices are zeroable. I know they don't implement the trait, but they
could implement it, and this could be used to implement e.g.:

pub fn write_zero<T: Zeroed + ?Sized>(value: &mut T) {
    memset(0, ...);
}

Alice
