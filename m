Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0EE37F333
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 20:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790974489; cv=pass; b=mJgBjJNM0/nsJJOzISCS6m26QP0cD11iJGgoXvJhWSB/ZJngUjINp9jXttYahSYTYuvqKbBSvW8oxUyUk4wzBlVTMkoJh3+oB8cWkCnNJMWNdYIHVF/+dBo9N8bFtafKM4kLLcrLO7p8YlraLOO60r3ReO3dad1BG/qiDRWlPBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790974489; c=relaxed/simple;
	bh=FPbM1GDy5LalmHteF34OI7jIXHHeFNiVKpeTr9QKEI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rv0w7IHYHbXjY0cLh2TJ6+bwAYAXx87lyV8zWxINY8bHpWIg0R4y7XXE2RuTZHYKxfcvGaGJGrI/Hr9D85GXAxDkiInzeVrM0c4R4S3lz+gki42usHuo1r16BaCTIWIH4gOnDCRykYxo5Vw6YZ68NIG0ZHO5Wk3NlLl6d5z1Uj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9GCGsfN; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9GCGsfN"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b010e8c94so1282eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 13:54:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790974487; cv=none;
        d=google.com; s=arc-20260327;
        b=m7rMYK8DSgKD5vfRc+EsTtA+Kl/ZC/AWMsqbDgW/M9tKNgtu0SxHQCN9JzRh7VhFjF
         orn/LlDLx/AtEJoj/cIQ6TxqVfVD8gPH2Lbi9qdrZd6ALJBcJEyU6BZ9BqZTrYxRayNX
         tR8WieKAkDguz12ogCA6tKk5McDYfTDCYgyso0CjIGUPLa67blGzy9GhiRDNntwBURFd
         LBJy6WwZ9yC8RPrw+I0KnTNbkIkyXRJhmjxRAOFFCVeFhnErqMkCc2LQM5BMOxXs1Jfw
         UCckr81KHDUi1m7gTnsfhOXTyyQHICV1ytHUNenEKE/vbwqH2o1cQN/BnVttfsRDg+B8
         Acng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qim/NL5w2hLnRP4b+wyeLHALC1NasDXWqntplgM4oTw=;
        fh=rSxQUBX1WjDPNz0pSfUq5GpvEOsa3itDZaHZ22XGlOc=;
        b=ELuq6CaWAaArp7QeFuNPswylnuaABLgdjeBWZtSoOGhrda5fxj1+oq7PJE0WyNOASd
         LUil+xUSQT/dpUIfeDWm/DPUhsecsS4yOVK0exkroGR2m97cpEhSAdpu0V3vdZzmwTm3
         i4ko1JqdoOHVfSIZ5okuhVU8WFcqmbYqmF5gzPdB8GiTkg0htC5PWbkL4b2jao6VEoff
         WmhC9VzmtyvNga/PhmniyM13BohhBVZcxXfKnI8li5FA3MQeqgofp7NWeoa6mqYvq1uT
         5DWGnlnoua1KyOMwCD40q3gb6nwVaaW2PZOj+LQTtGHKNCrWARgtr4ybz4U3KMMxn8w6
         k5UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790974487; x=1791579287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qim/NL5w2hLnRP4b+wyeLHALC1NasDXWqntplgM4oTw=;
        b=b9GCGsfN8ptSi6lIVdHTMjXIwv512M/JyosLVqfgikv5glQxBkeOMG9S/NzmH2i9ht
         75eZhIAq/D2vlEGU5pPfkXuYmu/AfJ0DkgazNsNhptU9IpHlFD4nyTQWQIC8N9jzBQAl
         U/SDoW915SEJ0+DZE9rLsrrNHRXfbgCj0bS0pG0SuwvU2T2JI6rKc74Q/dw9rvAtbst+
         woQWUct47aQHFySIObHGiGD4OGdjPeOYO9q1xanDJoOekaaj3Pst04vLaQhWXKvjx/xn
         SOI6yeIkdDZUr6jZRy17EriJbU3v1GHEK9kNsdgAt9zWFlvvnCjCZtIfK/zv1wthFOc7
         YorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790974487; x=1791579287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qim/NL5w2hLnRP4b+wyeLHALC1NasDXWqntplgM4oTw=;
        b=ieGQcdhkzpLFniSc8UhBSLJdn6TNBu21qTpP1ZA3yM0SL6P1Ns4SNT6Xg7kQ9asYhd
         +DlvXMKn5l6ncI1GdHccjuImZUKXk2MCQw2uw7hDMdRv4y84oiPCyu4ExpWhRwOa4ipN
         h+rbg5AfjxDBPz5Lq1MbE9PS1lithfGPY5tGf0CIE9G2wXlUR81fsJsVagD5Ntm3RSiE
         hR+AeWMZLJFeB6RrWoksJHNCTsUsKcPoQD9wLaKdUi1BfR+fcQYsQLvgBWzjeNTaUsLx
         99Mg87qU1heoaf8BxbuqVl0HERdKmF5iKgrOicH2P3LLMucp891sG8m/gzxDOjc3eIPb
         TGig==
X-Forwarded-Encrypted: i=1; AKwUvBw6B3wImRUTw+v/kgs4GI6NBrvv3/MEukGebey+9LzW8haX/x/ayF11a1WeVmMNXMN8xFIOGe/yXiD9nTbjqQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKMTcxJZbE6Cj/NLp1hSBzdctvBiYLX185k4/FOSri6634Hqfe8
	r3lLlk0rgACrsZ5ObxKjHmf2H79dpFnrMAaPZHVWrUr/gF4rBOPfvDhMqN3C33vTxgd2SXxHB8i
	dJDra9KfVSRAfFd3FJHrEnrvJTfS6Yj8=
X-Gm-Gg: AYBFou22k2O5VpcHf48OhBwkuhHuzwQCM85wADpvbCPTKNWI7urlmnoubCCh4jhs8pW
	Sczm5NPRWHbpgfIQukJfSV9haCMo1gSBCsEVuCu/LWLfu6n8bZZdinNsU4UBLmsQubPkPie6tPU
	sYW4kzMRQ+zfr1u0Y0bl6YkbVG4I/YQZthK1OLQhDblwXwtcicGhgI0IfhztATOp8jjspFS5RbT
	/PDLwcoyRXWLWSZ29ided0vB0x27UOKFQol7GMcTfYvBLma8LFsuFrwWsWv39ouvKEuDC07EUFr
	LaGyiz5DJj+CtKxXDpRO5n6y/NbHevRN0tyGWO41hcx18IpThidi9fhIH8lqglbp+iiN6Dhkbrm
	axinrMnHebhWNwn8r8uN7CqLcroNkVOYdluIW+DCUUQtFnKSe4oRuhLGjlTpCQVB0yvs74x0cYQ
	J7hSq9hwsPvmqovdlEsLfHSq+LCt4h5tPSnZNPqzVA11ChOZnzKBs=
X-Received: by 2002:a05:7301:9a83:b0:34c:f181:85e4 with SMTP id
 5a478bee46e88-34f14ffa69cmr6448829eec.1.1790974486869; Fri, 02 Oct 2026
 13:54:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-pr-ratelimited-v5-0-a77d456de974@google.com> <20260803-pr-ratelimited-v5-2-a77d456de974@google.com>
In-Reply-To: <20260803-pr-ratelimited-v5-2-a77d456de974@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 22:54:32 +0200
X-Gm-Features: AclHuK8p_mbjcQip1dbmQlFqSVa2-BCruxIttlWlGLaaUM11N16XqeSIiFk63iE
Message-ID: <CANiq72kCqfg_ZQdUD+dvxsKGfH52u2ydXQ-n8dK-0YzhiePeiQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] rust: sync: add const constructor for raw_spinlock_t
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 9:30=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> +// Explicitly list architectures where this logic is checked correct.
> +#[cfg(any(
> +    CONFIG_ARM,
> +    CONFIG_ARM64,
> +    CONFIG_LOONGARCH,
> +    CONFIG_PPC,
> +    CONFIG_RISCV,
> +    CONFIG_S390,
> +    CONFIG_X86,
> +))]

Sashiko is right, we need UML here to avoid a build error.

However, I think we should be specific, just in case, and thus use
`CONFIG_UML_X86` instead of `CONFIG_UML`, since this list is about
having checked that the logic is correct manually.

Cheers,
Miguel
