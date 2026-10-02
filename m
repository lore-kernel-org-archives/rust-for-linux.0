Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA9039DBE4
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 20:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790974749; cv=pass; b=W2q9f3pQ/ouoHlhT9q3+gdqhb6lc4c3108iLo+lP1Gu9Zc24kFRsQMlIqM8/ZmLpY9ktg58HaZfo/4OpLvpY05edHe8YAdThGA/YgqmPsCk226aleHBF2dwdfxiyfZndBhJzJiWrwrD+3e7EE7X/75wlq0Mf6j1pegqS9FYpCdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790974749; c=relaxed/simple;
	bh=d4zdnmEn5Tm+oEX/jZM8tuqzZh7o94u1nWOKMJtTrOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JSibZyxCxAvRe01JF0mWg2xYUbB9x39kbc6YPp4zG43mXdHEQB/yrskYhVJTZnvzkhSmAzk44G8t4LAkbJmWMEMcALykTgCl3PmUcckynFxP8vqE84LLeNpkflEumsbeJxtUJOMARgOhlrOMr1wOTlpDu97+/KZR97gRPgDVE0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ex3deoJy; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ex3deoJy"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c28125492so1494eec.2
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 13:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790974747; cv=none;
        d=google.com; s=arc-20260327;
        b=h3xXMfETVtTTzURpUyoLobYiYdkFwpY5QViUJLXNTAd4MW75/SIod397MrhcWkfEWj
         GVO7h3F5TWRQ1igRRkSB1gWg62cbvuARS1CoVJ0A2oghBTnBoBi5g0h5P7qpijEQZp1p
         pYpUux9dRsFQ5YFuIphwQvc6jSmjd7bT2BGNElLlemkDvCWrSFu+xmQU5e/nfwgoYWlQ
         f9eGDfMm+h6NXoDd+ipKI978ZQAkDqVj+X+GORj711FU1qMcf+gfooz/jfV8CsfTtgRA
         9zY6gsY2hWZbQzs09iIT7FrD9S96z1i5BVdvhms9lAKma7uNwsiqIC7IriCKJ66K0sTm
         c3aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AzHVDpXK5KLxpfOZ22bo8Tz/Bpd7WZiqFmkifAIRfvI=;
        fh=9W7ACWoK4mPB3qipR21TL+RMUWSmy24J/CAeoNy7GDk=;
        b=rw7YRdNMO1MJEs1u+iR1//IUxO0qmHEweDmhQ3TeBiqbi3cGrYbRsCtQOy7oSeMryU
         7FYfoKn0fIpVfqhlLR4hcLyxqASyEA6XUU5hdb2TvMC5tZP5SxHH2i1ewpR9x6Lx26B2
         LuidOmYLAr0f+m6/Tso1h3SLj/0P1YUUbHqzzrXWxC+gNwxLk3gn47DnQplIA5to+xg2
         WqfghtToEZwhBgbhKGCzVEM6xdofBUyI0yQRocd1/J+dliDiLFrzfjapHY554yDBlNzF
         +OVBK1lHgiutbqEtF+Ra1YD3pKDZaYLQTYEeKB4XdWAvS7YC6dLZoI9mtr0dQ1KhwWCi
         uToQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790974747; x=1791579547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AzHVDpXK5KLxpfOZ22bo8Tz/Bpd7WZiqFmkifAIRfvI=;
        b=Ex3deoJyZ7/qPIqZpKAUYvjZ5wu5lTkgigguZq5Yp/doAfy3ZraKwBt94L1Hl3eTfS
         JGSkNk504EFy5qR/sBSQzWRqra/KcBO6IlcWgWVLPvVifGy5FL6vwauxCiUe0LRPO9Xq
         O8JnPuWp1CazTF0RZiLljAh9XfZ+x8I3W7LueeiCncAdY1/jMDKCrtOqCV/GY7sF9gS/
         VQqANzBlUPaEi+kZULq709/OJdRwHQPePo6g3oshSeIM56oWspvaocu1PLRrktDLcCnd
         swZvJxDJhPkvABdv1idZwG1fP1IxjlVtV3HSgKTpttcqYg/gSojjS9LT9i/0eS6jJ6hr
         /xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790974747; x=1791579547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AzHVDpXK5KLxpfOZ22bo8Tz/Bpd7WZiqFmkifAIRfvI=;
        b=TWLHYcgB4/Te5p75L3l4pirdd0pmjGTKLnnrN/dxWsPD+VhUfOoj78yEPlSWF+IuFb
         nJQBBdP+UMxxTFyNS7ecotNPNmiBGOBHUXs+PTGm2LIer5O+S80mpH3glHrFsKNmDusg
         KuFn/RUkhDb/K2N20XkW7YExnDmg6yOMhs3HA0FR/ucNC+JQV4TOt0QlFkkB8miV2Rbl
         mCl/CI4oLop6RW4NzApAp0bKz6ONcnEAijckleUXGri5wqPCtwbTuywRjeSJinchbjO3
         ygevQze0t5ZX85f735XaxoHA3iNnc4LEk3hGFXeN2YUsA9IBqpt7ZCjNyF/Wu2WcNJUb
         Xzdg==
X-Forwarded-Encrypted: i=1; AKwUvBzeH6NHKGyBYeFKvXzNYuhe2WJbKhK+UojsycdiV5mBC41PN65QfwHQwi4ISt59EksYtKJ0Xt9/4ll2/ohJuA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIgcxkLuSsBbPDtfv8zqJILH0BpwokfeTkiIci/GL0GlLJJTX93
	HkLRsIQEMT+fFxOHk+D5XHH5OqZBbQt4E12ZlWbAJcM6YVvvJfRQTg65ajZfcHM7T/dI+nGnkV2
	DvZbWElMCSZ56ocvbiBbZl37G166G7bI=
X-Gm-Gg: AYBFou3VRMbycLdEe5vgsNCIznSOF+nfPZkWAYolGKxMaFL9TOiKlJ87t76RbcMJirE
	UWWZXABAnlBivJlEcexJ//Xa97h2QoTqOnXH38SYDxDGPzuyMdTDkQfEGdOVSnoSzxBEkNNojkj
	gZs08FPTn8j6NRIemFCJjZVhK439S/gECZtUaiSj3HsQqHFBBULAAzYzL32bbzAp/0EN6lD1tF3
	3SHdGK8zoIHHnFJAWp/IWiqbkYnGN6SvpwC9DI8JNtX66IR/xY5GVB7prCSRddZ2kbMswaSYluJ
	IK6LHrBfrVGmNFkSgmiPShk7rAGq6oaE7/AhGfGYb3vjJfoeN5t87auVtbre2XRN06xEbPY6lSx
	G9LrDueKsanBwX2J6nqYLtglUJ5f2qkt5BPIyKseY44HgdDBYfaPS8PRRqCzLTY+zZwH0oJcmpP
	RNe+4FpjFXIBdviPF/VBphuQBAtmF6eFoPyFtGJs8tdARGT8RLiI0=
X-Received: by 2002:a05:7300:54c3:b0:34b:47b2:677e with SMTP id
 5a478bee46e88-34f14ff2bb8mr6999038eec.1.1790974747077; Fri, 02 Oct 2026
 13:59:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-pr-ratelimited-v5-0-a77d456de974@google.com> <20260803-pr-ratelimited-v5-3-a77d456de974@google.com>
In-Reply-To: <20260803-pr-ratelimited-v5-3-a77d456de974@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 22:58:53 +0200
X-Gm-Features: AclHuK8s0H8deXBzdQyOJ58OT7ccmt_U5WfDrJaJxOcsbsZlXNomLs2P-gq80PM
Message-ID: <CANiq72m2h=g5AWQQqfUKkgFfj1vCMEDbVJ25UE4a=zu-MUs=Qg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] rust: add pr_*_ratelimit! macros for printing
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 9:30=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> +    pub const unsafe fn new_static(name: &'static CStr, interval: i32, b=
urst: i32) -> Self {
> +        Self {
> +            inner: Opaque::new(bindings::ratelimit_state {
> +                lock: kernel::sync::lock::spinlock::raw_spin_lock_unlock=
ed(name),
> +                interval,
> +                burst,
> +                ..pin_init::zeroed()
> +            }),
> +        }
> +    }

Sashiko is right here -- missing `// INVARIANT`.

> +        // We don't set `RATELIMIT_MSG_ON_RELEASE`, so the function name=
 parameter is not used.

This seems inverted as well.

I hope that helps!

Cheers,
Miguel
