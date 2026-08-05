Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563A11FBEA6
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 12:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933058; cv=pass; b=dvS8naEYgtPniR1NNhUqnbUGoL1PL2e6TU0PG0Xna1c0JBTjurS5dLAa5/T94KVOXGOY4ZLDaSScvRDPnP4WMh52RwSKNJP35UIAQ59jxuIwpb85hlQAFTNvyRw1wlcaz5F3L3/HfX9m6yKBQtY+KOn0RkDNQF2iYz5hEXr7HBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933058; c=relaxed/simple;
	bh=GZWccrHTPy/H1GfxIPoH3/kFqiPJnrQrAk77xEASSw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJQV6zRmVKAvFuK0YkFgiud/adkhapQWZHbpPS45q0ZuWMibcifUkcqRTdFb85i9EloJkkyCINT0aW1fIfARkjLNsAJgFkzVeRSBCp8snXQoQLAp0hNeu7NPdabLSTpPwMZbRPHBR3BcNXlGhFbypos9H1f11AUIr5gkaH/Wdm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyzR9VxJ; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyzR9VxJ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cf110997efso2296355ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Aug 2026 05:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785933057; cv=none;
        d=google.com; s=arc-20260327;
        b=XQCuvRmwxAlHUeL2/Bu6d1fjCYvt2r7o2zJCFjQ6hHJauD3mpM2ASan2mDckRxzW27
         1OjakWdTBF+r1b4stwshe0o6PG4M29PYciKXSl/DexlxW5JPX+z/XP4m26QKyhEWAKn3
         Hv1zk75Vd6ci3HKX7HQNM4a0bMY97DHuZTMRMK4O/arke1hnBNuAnvtmETdU6M4S+WaM
         6v2GHxEH1rMYP7Z9WwT++Kg3Q5/GPn1diFfj/ituGx7OfrTzJ4fm/9MESqjJM/QL1+2Q
         6Lk3Qeq9B4QPGZjjQoUzPdTtrXS86upwwqsZvtOOjRD4M1Axpo8a9NtGeuzgNJQouilW
         YbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GZWccrHTPy/H1GfxIPoH3/kFqiPJnrQrAk77xEASSw8=;
        fh=ERBbtQJpVDRu1m5rT7s7VWDN79LobnwssY7wE/Ruhkg=;
        b=BIBZamW05welsWRoXKLyCrETOr6fFBJ7sydzBSx0kmvJTL7G65kypb9teYJEBBo4QV
         aEhDyLDpDmzk5naPj5Jugpj/W+BTP9spdPBGlfbwUP3lKH7w0cyGyIN6SmkPfP+PaF0K
         tZbRUrxu1nkXs5RQOo+3U9CPndoOqkSDYlVdKvxOHx4Q/gP03eljv2whPtiFGiO4Qh/D
         VBkjPido5AGS8sPVvlG7on19IIW7tTzBrgwcq0wRJvbkyE48NRspx3xaKWOf8Dny/5h9
         9InKgFJCKNxgJH9COy4TA7bRwLI4lZml6PpRYkrYNKHG/Iiar6NtD2RZ6hWOK21IZ5XC
         5Y8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785933057; x=1786537857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GZWccrHTPy/H1GfxIPoH3/kFqiPJnrQrAk77xEASSw8=;
        b=TyzR9VxJoL3DZFCnC6J+gLN/DV4zd/zKvtQd73Os33k9xM5SChqs/AYDYFbm2XIpSb
         /gfbQlv5BHvN5VYfhQqS82YR6AuDoNLpumECvqPkmGEn3sQjmYTw8+NZdM6TdQBs2InY
         WPDnxV4saRi/egIk52KqYL4YeRbYJK7tmoRbowGz1gPYknWHnzbchinHlMYcjqMloi7z
         hYLniuWKYpHpdAmQ+NWh/jmF/YLsLEO02ktqxaQ0HrtJw30Xj/bQD+iLaOd8jJKqHA19
         70BXUP5Tip7wXW0k7ONO3fKT6h5rhgGebcwi7lRn90uGtdPZTUzDySxRZEuJD3RwFxnb
         l+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785933057; x=1786537857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GZWccrHTPy/H1GfxIPoH3/kFqiPJnrQrAk77xEASSw8=;
        b=Thv+ZtVle+K/xvMA5naSklEAfnbB3Eg4kJp4PfX/0jqrlKZ4S3IZKaqmwUycJHS0U4
         gb54UvsIk2dvo+SFIKbGxVhodKtlTYcm8E6hDAD5sU9JJujYwrB591l7MhVgcgLnTcpD
         LmP8gnWi+sq9u0GQ33vJNSVA/Ybg8bsmThLMTh8y5cqYbCdnFUOBWQySBOJH7iJCWDeK
         L5xXB3NSuAO7AqSoYITFj8CopJuF8a8g+swu0j4spBFVXTRGxl5ChU1V46lhpDRD/B8p
         V5QxuF+Q4QQFKV5o+qDD//uYw9UpmvIEm7sm+zPtO7wCML6Vu6G3qgIfGKnyJ2BqMhkw
         Q9uw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6PeiMUnuHMJ3c+GkSU9p8+KgpMHsVU68OE8nfBg+M/XZ+yRAMrE+cI8MW3lkSybIoouimAw0ui1/NBe22bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd+8dHQAM36l2StA6SXl1QJPvbxk5uK76UYtYk3AdqO4gU8ZHO
	H2dl6i6Gs1YIKIgwAjblrNSRz2ccNSIYD2AZ+rYGvL99nqFSrCm1HKmIER8UZCUVyQWFG5Ym/iV
	HVpbEBkaiI9RDLvSVT+QaeshXwNsNfvc=
X-Gm-Gg: AR+sD12NeKiJkvtV0DIVOtHN7d08J0tl/gEXlugrGcJZLQiqTYRrVa7xFq2xV8dPQkY
	D34FFwHsYOmDfoFDUd8EJAemg1znEjTixKtXVmpsQpQIa6LYrs+rm7oZf4IfmQ90O98achwlq8m
	HuGUDUMrftrnyQ1NzMzOjmhL9gfEpjboBdSKESWSJx8hd+IMYtWE1c46ThoT+/EwASjNcSg+I9W
	ktidSVKJZZ3IIsFnMJoM8E9V+DCiYDKNHuYxREwf0yFppIgOT7LBvYrm1Q/2Vt+ght33Zqo+1XQ
	8qSWTwVlt+XH1VD3wSsmA+MOhgYVfsmiaaTYT7jhjFwqWdgj80sgWKJCZFQRqeOSSir+q/7QwEq
	4NSUpFAkpEl6eBcWTNqWvIDrucc5jpYwwqUJAwtfl91CZIFqbonMeWMGOI7Sj
X-Received: by 2002:a17:903:b85:b0:2cc:e7f3:d39e with SMTP id
 d9443c01a7336-2d0caa7e443mr49239545ad.2.1785933056713; Wed, 05 Aug 2026
 05:30:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn> <anLxXvCKBcAVf91_@google.com>
In-Reply-To: <anLxXvCKBcAVf91_@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Aug 2026 14:30:42 +0200
X-Gm-Features: AUfX_mxsC_TB2hM8WBRvMia8N10V0MGUGToVnb2Afyq--fnIE0D0zPfrE675YSg
Message-ID: <CANiq72=gz6RFVm057RwqARGexTcsphC+X7EP61WP5v_+GAhD+Q@mail.gmail.com>
Subject: Re: [PATCH RESEND v13 0/2] rust: Add safe pointer formatting support
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Ke Sun <sunke@kylinos.cn>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 10:16=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> I got:
> rust/kernel.o: error: objtool: _RNvXs4_NtCskVLJmUDtH0q_6kernel3fmtINtB5_7=
AdapterRPhENtNtCsfr3MPOfBGpN_4core3fmt7Pointer3fmtB7_() falls through to ne=
xt function _RNvXs4_NtCskVLJmUDtH0q_6kernel3strShINtNtCsfr3MPOfBGpN_4core7c=
onvert5AsRefNtB5_4BStrE6as_ref()
>
> when I built this on x86_64. Miguel, are we missing a function in the
> list of noreturn functions?

Yeah, I can reproduce it and yeah, it is one more we need.

I will send a patch to be applied with this series since we only add
the ones we need.

Cheers,
Miguel
