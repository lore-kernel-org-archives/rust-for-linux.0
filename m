Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4E422541C
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 04:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769748324; cv=pass; b=Wiuy3mTYt/OgCHF1bJeGbCSXvuPQLQwVGFkVpY+S6rU3/r84pg7L77YCdokTg4e0SyIY01fpSJTVp5cSySh0OGhhvfI/Zo2mstiVBKhJJUOK3alfqHhwdn9DTGBe7MajfHL5hsCJOagxegMNyaVoU2m+GiMNgTWYqg+TEV2d32U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769748324; c=relaxed/simple;
	bh=j5sTRnzPjz3wvCNU3OF2BowzpzjC8BR+ik08DcuugI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oA2K1MM6tK9P5IJsCacqV2QCKbVBCNaMHtibLfGvekfOWcTmkrUelTdEOTNom7BE9Y50heGAY52aLYeD9gRpA36bwZI3vU0hjnIR6WzMW6uqt2ZTX3yf5vKnqasZ40/NbqzQoQzS4+yPJfvCGhIwAV4Ljro/mbj2eLdqZZw0pUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkKdYatC; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkKdYatC"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b78c97f57bso16238eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 20:45:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769748323; cv=none;
        d=google.com; s=arc-20240605;
        b=LsMCPRn6wBkMi8D/LEKYLu2c6A9gV3xVYb7MotJUfB5mx6ViGcyNrxikQfPAI4SFTm
         lOPhcouJ650OhO1iDPFLTH6Vs5F5h9nCMV4yNtHO69zOIub//iaZbVkVxcHJPxhosvnU
         KQ9jt25N2SqUeZLCdvbm+z5ShjgW2nFzX1qx5pMe5sfddNi+oQjI+dz6q7OLm2aClh1D
         IJc9MEf+uintH9+GpqE5gJuGdW/s5mBG7cblI2jdn4kPuTz5vo+tIJQU9zO6oS8YzoCu
         vdrVRQyFV3Io5mTeu1Nk2YvH8W12bj1xl/OM7tnOoDWA0kIIDgX+edgS0chRC+E6hk29
         OVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j5sTRnzPjz3wvCNU3OF2BowzpzjC8BR+ik08DcuugI4=;
        fh=a3sJVvYzhzlMJ6dwgVh/boydrvyWmwjhEkVFzNj/T2U=;
        b=Z6MCdaU+JKFBzGq9o6Qd/aRx1wKyaoRGGcgHru69qAPAY4lIHUURPdxDPRh5za7PSo
         aZYCP6uho/KTvB5lnMHyXJ8CjLxYoI9EQK1Njk05k2Z01vU8u8OwmkkeE0WqEnAdUft9
         jDm2tl/cZJGtB/8w4esZhoOTSmAskHVOP5x3Q4EPrXWKqfnBGuFl9Biq5pyIB0ZiTviN
         N6CjmOvvSkO5iquPHF3VDPsUWHg/LGhZL3S0Ca9W1uME+ZSlZIzuOeoGGIcF9m5JhXEt
         7vcc04MrU8Lz1t1z/DCXd2X/aN7/8VEWROOhXj8CWu8wQXvPnIwMfzqk4ZPeoKeQ5yQE
         /zEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769748323; x=1770353123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5sTRnzPjz3wvCNU3OF2BowzpzjC8BR+ik08DcuugI4=;
        b=SkKdYatCzzVePSxRPdEO2bQgpbx9AwceI8clswMqy9KX4o9tgomn7XBniK9mkJFCuR
         MhP47sKE3VOQFfkbJeStDAA+qDlgE4iiHX0sPRutQzHEl8BJURYe/wvi8KvpdYFIwsBi
         5xSGalhj9cQcKwqDkc4rY5Yh36yUUCzqvz7YDplAQaVmw3US1Gi2HtCnVwKcnD5tRUP9
         +eB0rJ/2i/ivODmF8N5GX4axAm2X//YruKwRCp1XWU5ex5GtZxB/fS5YRlOVv2c0/BH3
         rC7DGQSQs2DilLkaaIVX94nXZCDiHr9BcF1DBP9YW05hCaGPTftddopn/cKTD9a7eh3R
         HrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769748323; x=1770353123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j5sTRnzPjz3wvCNU3OF2BowzpzjC8BR+ik08DcuugI4=;
        b=hoDcVxWu2UoxKBbcI/rsR5Vjl10wVYut+KDpZq6XkaS32sbXq1WDkKSR7TSuyvSk0/
         FMpP0+nFNwguUMkyrX00/hYabnmrj8e4y5EOJFUn3fXgn0snw9qDGCqiYBxCl9jt3pF2
         BEso4DOKOqQdXVXWzaCKADY4cbEeniuaq7hSeRqvpTKiP9oOg34r9mjVMAnvEIY2HTK1
         BrR3X9wD9AlKJrMqO+9UUQXAzCQtuEx/l2v+fjv08C5h0H03RzZONpQXXuFt/EO/mLqh
         K8BCjD3iR3GOCDdMX6rxWKNAoiYKQQelfyKrJzH2avi+q038cMifoEgVCASch29QQ0vx
         YeUw==
X-Forwarded-Encrypted: i=1; AJvYcCUA/zzKSEYyu3u/kVV/KNBlT72CYYN9j8YwHQmmfM4tUm6JzTd9q0zrR/mOaMgOnWioNSMSqk8bGTGN66nGow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvYQXV/1ZmildN+6sHkUr1n+aPjsJ5Stdug7xOfNK9+ZS6od2k
	GmqS+8PIkNt4gJvwEw0TV3/1njJ0lIAwWZo+HJ5ff0GtY05G0A2C8c8ixGX89W3UShTcf0hXOtj
	32TkV7GVBtKlWtA9kfs4XGKhRzugrq5E=
X-Gm-Gg: AZuq6aK0bHXH/mKK8UJJ5FEbGEbvpmuMfOrv9IGXk1Njv79Nbx00m9bI3la3S/ZnM8b
	k8GuZU9PcDaM7tUgRSY1zvNQLUEDPQ/VZq874LZh7kPmNOtWoe9Z8KSopJ1frg/9n9qJUb4CRO3
	JBD1li1maSQDky65zUn++JN8KW1OkZdNVMGyvidtO7SKm45gFSBu27rwCrBGtv7bKXpA2FUDGJr
	wS1olLrryn3j9QZrz6y7Q+t6l29d1j6x+affiF6Kikjf49Wz+pEXZZPDWc3WuM6ffxYSuVDIyQ3
	cfV4xb4I3onFyp6ahf1UtYN0GUSFr2+AT4QtA7Yij8OyvFzWI8SLu0QWG4uANyzvNQxwFIA6ODp
	JKstKbJtbQy6It6p4mPTINps=
X-Received: by 2002:a05:7301:3c9b:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2b7c88e6dd6mr473954eec.7.1769748321071; Thu, 29 Jan 2026
 20:45:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108013350.2880613-1-fujita.tomonori@gmail.com>
In-Reply-To: <20260108013350.2880613-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 Jan 2026 05:45:08 +0100
X-Gm-Features: AZwV_QgZi0B8AaMe-Q_Oc03CdUxJG0NpFZq8I3UmbFQ7ofCHgp8kP-l8Zs5eu_g
Message-ID: <CANiq72k5TftQOSGAtWnbuxL2D6oyLY5=zBh5tmqboAaY09PQyw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: bug: Support DEBUG_BUGVERBOSE_DETAILED option
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	gary@garyguo.net, lossin@kernel.org, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 2:34=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Make warn_on() support DEBUG_BUGVERBOSE_DETAILED option, which was
> introduced by the commit aec58b48517c ("bugs/core: Extend
> __WARN_FLAGS() with the 'cond_str' parameter").
>
> When the option is enabled, WARN splats now show the evaluated
> warn_on() condition alongside the file path, e.g.:
>
> ------------[ cut here ]------------
> WARNING: [val =3D=3D 1] linux/samples/rust/rust_minimal.rs:27 at _RNvXCsk=
7t4azzUqHP_12rust_minimalNtB2_11RustMinimalNtCs8pcx3n4
> Modules linked in: rust_minimal(+)
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
