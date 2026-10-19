Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9E748CD59
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 07:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396178; cv=pass; b=IMx6yEFPN+coVZD+wY+ZNAsAOsDyOpUYZdWIEWzCocNTrWkgUCEXL4QezRFcp5NwJZpj0hl3TVL7gK43ItIhMSbaBGTkd3pUF1ABIqXzUMIFPZhxNtKvEdHUlxXKaiCWjsZ/3RUY0nc68fyv0x0VOxtr315hO8W9Yef2npOSGt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396178; c=relaxed/simple;
	bh=18roVft8Al0rMKoiJRarieRYXelO1iPaAAZxWL9z6Jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWva5isapkZcCNOk4S3JZOkkuHXGTXVvhvsjWfMGgfcHcDDdKxzkUJ9a0zDcn+jegAtcA3ZBeGDCiayNT4qfbAitSbxpCVBeHcGOb60YG6T+Jjj7nmeYxP7+e3VyxcxUBu3pUIM1CkbHvZMWaJXMuLNR/LsjzBsrOC/ac24BErk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hggSAJZ7; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hggSAJZ7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so16095905e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 00:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792396175; cv=none;
        d=google.com; s=arc-20260327;
        b=o+5OPIBZNjjbVl7/POPrXQ93RK2q7LIjgSmX5HunuQRPi0N5wLXIGScQG6SrKzfo9h
         Gs92MXb5W+rKL8GvbbIj0q46o0QyGcIq6xPUZeq7sC/1ddG91T6PIWob77ObE3OUjDRP
         J89rmP8feXBh9L49JUIqP30ngoGG0a4pK5X5Ww++UPqImYBV8TY0nnaVInIeKZKZMlWR
         6BsMbJCX05wtii0HWqg0A/algZlc7I/UogxJWK8suAUwZ/ow9yJbuuL590UcdFxP0HjD
         AJVZkSodR7mRht1dBd/6KLxO3ueJjbLqg7UDXoI1UEaTMPgibsbZyQbDqSQ1DI0VuYTu
         z0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=18roVft8Al0rMKoiJRarieRYXelO1iPaAAZxWL9z6Jw=;
        fh=GuyB3Pv0wy2m66Ewj4s1uO+dunY+AC/HzIqsDuMOpjg=;
        b=OpujDsYRGRB+j8+XpdOnmagjR5qsq6809uNbHkeitjsXMGK08DX6RqD4icnogd69X4
         mflsl9pqX7M7WuGyS278jljzdVUoT528OOellMw6rDzO1R23LkQyS6MAdWx9QXvrht6P
         ozc3iU9MXdH20NnJhhLaAWItP1qRAqpeSYyL2EOKudaKJQx80DJoLC9hhwk2BE1fXOLG
         inLIO5Km8e+W2fV6P5/kseW6Jk9RLwq7ZTltc3nUlsEsBa+XBqo1YS9EBNFzNr9MXhns
         acqmUzBfkRbGmsKkKzKTtfsdp51XpUPxT41mPj5UJ68MLnapGP2W3JU8I15xKDDfYMZv
         0Cpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792396175; x=1793000975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=18roVft8Al0rMKoiJRarieRYXelO1iPaAAZxWL9z6Jw=;
        b=hggSAJZ798t24P5d6ezjFUTHNKvuADCFFzA1N8Qoc+WWTj64DV/3DWpiFxqJVBs6cA
         BtYr5PGivgk9GsiiW2zV/UF5yTQoTeTNDpBKV8Cux+n/caERYO2RDIATbBhuPxqvVBOz
         9Vgfbxm5dJToPGvXLGHek8ZxL0KL8uUkRJGkZ136nI1QU+75MOYrRn8ZBKl4dgX3plzj
         03/jRoQq41L7D61Ll42UhPTOjb1cauoPzSTYTayrr3jOu7uqgSYEulhlPfPvBZEq0bt3
         8kWQ2g96Wx8ceHtv4eYUrvQm+MU6JHPBpmhSwk6wbm2obJbNgHyu5UThmm7BwtqWLrZj
         6f6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396175; x=1793000975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=18roVft8Al0rMKoiJRarieRYXelO1iPaAAZxWL9z6Jw=;
        b=AOhxsH3H6xBGbdGr+2ft488resOBKb7xAp/Ba2aikeWNGP2IexZXEt43/fARHYiqTP
         zjlZaPQSWm1bBogjRCMy+npKkgDgNcS4tpQUL53mGglTxqxy48v90obEOzybvIizR22l
         T/lDfbGMS0RGfhCb9RucohRqFSr3ElwZC7uBCp0M/9V/SbgsjP3U9TKrZ/OzJ6+cKfHw
         y0uy+3h+iVf3Cs0tBWBdgY0JC/22qoWLVL9690X/PsC7SVw5+odp12kK1FzigQD9h1yl
         Mu9LtDMuBFB/Xc5Fx0H5XMe8XQk20d1r+qkt1JusrMfX6jaw4CnedlcCF3XSYL4m2PKN
         LEYw==
X-Forwarded-Encrypted: i=1; AKwUvBxvKW56KvQXoGY/Xc+TZTe2TyI7/uINuxaqF3XfzwQ+AANjLkk+S5WHs8xyh0dLCtOnMRZj+JuzanrewqqXuA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJth5EBMhH13K2LXrxfsBEg2/xqZ5IDrsmgbcDH31ZJKuwl15NJ
	b9AMhoWYQJS3s2zzrRInXiKe7QBK9S8XIX9JAn0mDetZnJMFijY9fDHqt9IAZ7mibKSvKBoQ2Hs
	MkqF3dnTwP3IprJJF5B8h+wNYwZoNn2mNVrkEjkgg
X-Gm-Gg: AYBFou3h8R5ZQhyvGUSrdhd36u6MalHpTrcr1ky8VntyQnwmWheRBzXciwtCNM0uCKB
	ss2t/d0lPNJbU/wjV5otQo/PTwtVSrI4E+IjppZ3tk/PaXbLygZgKkPgfJW+zexTQbaeVrsSRmf
	EqhbE44cN5QaC8GEu+kHiOZRA7D12bmlrCfaPwFfHZMJXjgeISLbYdNO+9vTSef6nGALIPhNKXa
	oCBD9FI/uXbTlYOzgazAxy0Zw/t/4ClJGwXsMnNEhtAONsxT+GDStv0sWacMic1TyQjJStaEd9m
	QucYCS1EiXH4uODz/kuSg52uHunQ5/38y8MA2nILJ5b11THSS2NRxpzE/SeKRD4bsLMZw297qhK
	DFWiC7oC8tn1m2gKIgWJiJhRrXcF1ECOa3P263ClNOLU4V44sz/Ld
X-Received: by 2002:a05:600c:3b1e:b0:49f:fdca:c361 with SMTP id
 5b1f17b1804b1-4a1d75f9341mr157530715e9.12.1792396174930; Mon, 19 Oct 2026
 00:49:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791594262.git.pgovind2@uci.edu> <b3cd79f567b83712155bec1a32a0e1fe174e9b1a.1791594262.git.pgovind2@uci.edu>
In-Reply-To: <b3cd79f567b83712155bec1a32a0e1fe174e9b1a.1791594262.git.pgovind2@uci.edu>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 19 Oct 2026 09:49:22 +0200
X-Gm-Features: AclHuK8rXfzfkWa1LpR1kXZbpHbL2AZjmuoOYPmMNGr9zctAilKW3mca8FC_Igo
Message-ID: <CAH5fLgh7_vpfuU7wLrgO4ZfW=bxvdL7aRhwW20bBK0Y0PURz_w@mail.gmail.com>
Subject: Re: [PATCH 1/1] rust: sync: Make `GlobalLockedBy::as_ref` unavailable
 if T is not Sync
To: Priya Bala Govindasamy <pgovind2@uci.edu>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, ojeda@kernel.org, longman@redhat.com, lyude@redhat.com, 
	daniel.almeida@collabora.com, work@onurozkan.dev, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	tamird@kernel.org, acourbot@nvidia.com, rust-for-linux@vger.kernel.org, 
	ardalan@uci.edu, zhiyunq@cs.ucr.edu, dzueck@uci.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 7:19=E2=80=AFPM Priya Bala Govindasamy <pgovind2@uc=
i.edu> wrote:
>
> The `GlobalLockedBy::as_ref` method allows `&T` to be obtained from
> mutliple threads even if `T` is not Sync.
>
> This happens because `GlobalLockedBy<T, B>` is Sync if
> `LockedBy<T, B::item>` is Sync. `LockedBy<T, B>` is Sync if `T` is Send.
> Since there is no requirement that `T` also implements Sync, it is
> possible for multiple threads to simultaneously obtain references to a
> `GlobalLockedBy<T, B>` and then acquire `&T` through
> `GlobalLockedBy::as_ref`. This can lead to undefined behavior if `T` does
> not implement Sync.
>
> Note that a reference to `GlobalGuard<B>` is required as an argument to
> `GlobalLockedBy::as_ref`. Therefore, this issue requires that
> `GlobalGuard<B>` is `Sync` which happens if `B::item` is `Sync`
> (for example, ()).
>
> Fix this by adding a trait bound to `GlobalLockedBy::as_ref` requiring
> `T: Sync`.
>
> Fixes: 8eea62ff94f4 ("rust: sync: add global lock support")
> Reported-by: Dylan Zueck <dzueck@uci.edu>
> Assisted-by: LLM
> Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
