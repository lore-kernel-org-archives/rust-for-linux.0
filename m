Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52252337BBF
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 17:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771868810; cv=pass; b=B9l7borwnGEminxSb9ZkbiFpx8qEeqPFD68kwhEGkNwBH77QtAOtJl8e+ZNKGvzWcphuVt2jOs0N9rz2MsCyVDrZ7LsUgFxjTpCcuexer9anVHUgSgbpmL5lVAlNYmOFuYkFoKQxOG27DEqGIZKjvXUj9ZY6Q/w/5g9Hp+PLb6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771868810; c=relaxed/simple;
	bh=uRM75KelixGIsxm/+IM8nHx9hpzHQFEP2u2MRjBYNQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUanOtOfF9zl9Vj/WU3l28SrPd5O+M29Pi4Wsm7LpzNQ3+T2erVfzyEgxTul2xsaHFOhx4IqMhk89VAlbR0L56rTzfKRNq/Wv72sR3mw3fJK8QNXJap9M9jMdba0kTyecGp4h4Zt2Ue0naUcq0SAmhv355UfSmorCEbYNUl8YD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZdhY91xI; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZdhY91xI"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2bd801b40dbso146840eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 09:46:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771868808; cv=none;
        d=google.com; s=arc-20240605;
        b=UElptMvg/uWEYRXiMk6fvj7G/SRzRwGIBgdpcoKMbljJe+gL5K3LMiCMP+eCQ7geSK
         yIlDh4BS86/1Ko6ub3VixQxqtuHiLv5ggv7RY2WvHe3j1b3uPme/xZ2Ss8lMDE8nig/W
         VD6DvnaTmLBPZS+lPDyZdnifPPKQdIQTKXgcZEHiprweZcbUmBJLiH5Qpkj7bZTsbpkg
         rEEcm0my+I2XIxXiKcahX4kydHmnT4ES6Je0cn/Ute11+OuqfkEuulrDUtBZRgmshRje
         OT5ZOudPuuwDAPUDYx/w5+HNJcBz3m4JSl02V782CdsxrdzGO6dVdIHRJ4ze0pGWhprS
         vVxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uRM75KelixGIsxm/+IM8nHx9hpzHQFEP2u2MRjBYNQU=;
        fh=Bj282KvzUBw0piobLDYFkw4HpQMEyRUuVxIpdapNu1M=;
        b=eSbe+M9rmu7EyYpe6HBRZsJKbiI8Zhj9oDRB6cngDWclGLFObgBp/xTC+phhN+n+U2
         4RgD0UOnTt8/U20CMCarLlllG/9caOvn90VAIhHW1TrRWRXdB/V4lG2qgA3+9OyrGGMT
         RWiUns52nPWiz2qQqbWHTovHkj2SeD79WNuahOQ8bwPTc9EyeGgwk9drIqEBCUPJoSeb
         3klVRpFc3I0vHDPzJhCObrX6VdcNsacv240tou8R+lww+6pjHv08S24gCQlEs0tgGqrX
         zy51Qu36QgRIjj4ciwcr0Ujlu6eFNzIArtiUau1Ea9Zc38fh8Tngd/NMR9jQuZ3yl7D5
         UJlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771868808; x=1772473608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRM75KelixGIsxm/+IM8nHx9hpzHQFEP2u2MRjBYNQU=;
        b=ZdhY91xIy0ZWY+/a4OONW0Az9OQmKGQqloJFiU1z5w2gSHD1xw0r6qdASemmN8yXdK
         +8LpsYHSFkqRyC7qZ7lpvK/vytpOkBicTJtij6JYNT9ZCxaCjPVN5m22oQMFs/fycSNA
         wuCqN50DatRJsSCRVLwR318lyknfeRvMfxiuYnpMS5cwPOomIRVaHXLjhxyeaCZEMzoG
         JoIbye5YgFls5sEKlSN9ZIHqsY+sw9xCKTIDCbBZCMVLfLSjQmj8SKpvTe5/1j6FqgqO
         BKMjl8bEtVk4SXi2vuyBkxNF6ONomAhcW4FRY948auzSqT667yIIAFx8o+fzDppeueT4
         OMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771868808; x=1772473608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uRM75KelixGIsxm/+IM8nHx9hpzHQFEP2u2MRjBYNQU=;
        b=I0yVQi8gzZCNJymivP8H89x5Ycb1j9+v/BY3hn1F5TBQ+8cHTc+eY+qzORvsz1WgBH
         XZG4uj40ROKwFn/99U401aSL756p3uZmtdgRt857kCb8UV9vmi7B/DCdHHvziBdpyqch
         3MyY8Zh31zu0FHZIwpKSc4plu4r3c85V1c4HE5yHmy0mVQ8HA7/uxz5eRLr+2JBmXXw5
         zJ/z3WW3pcLqy6++duOn0AQk1tsobaxLqO3Y1NDkn/AyS39L9d9QQjgEuwlm4ZUX6eP/
         u0haK0MX4Ag0ErFtnH5CYV8JP6Vx2+vmbbHAAohmbCULmyJiQnQh1k4GBfhTX/WSqY6U
         AItA==
X-Forwarded-Encrypted: i=1; AJvYcCVGCYQMZ65eFM90gMSwOo/yQMgx9Z4PEctB7GfNwCViMCxNfJe3yF/m8Bfbuvus0rWMOhAcaq3MTiZaVAAA7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3wKXt2hdpUoVd0yYKxmLMm4zIwvsOJVmE9ZrxUh8UU9sDUCSs
	nWJJQlrHROrnqbvHgJbdvkD7/FwBxHASHK2QWgN0EgfyYt8dAe9T2q6NuLwutoJ818UbC8C7qTa
	pSVkkHOlwDXtVeknBNFG+1Z4hTwewfCE=
X-Gm-Gg: ATEYQzwK6YLCfl7yxnzqbdr9uyeJNKSIYLXuMGcnR80wDDCtk4T7t3M6HGWrkwOLysc
	B0jjQqMikwbkL1LpR2flLnpD+m1SBEcdISFXRyb+cOIic76ARIYj/J7GTZPTboBwsjpo4UfnZLR
	uTB6ljfkFVUJLftgnqAeMArhqq05vbHeVHg+mHOKVdO+KVMEIqZs6i/lN5lzofYlh5yzXmf1soo
	9m1SobNN6Jbo5LJ+ghJKsli6N+g+Zd8QdnjdhxpwS/v8sNUsFhaw90eAVqYA4XbzaITUU5XyiSw
	3yHsejFi3+1ZCY+B5DvjuyRr1sfa7FTUL5dfVoM4l4u0JoB5rXqQCdZxjpKOySZWb3J+lCLSXjF
	ePgAvnHB5sURhxjbF+A7vCSN5
X-Received: by 2002:a05:7300:cc0b:b0:2b7:24a1:865d with SMTP id
 5a478bee46e88-2bd7bd59ff2mr2223350eec.3.1771868808231; Mon, 23 Feb 2026
 09:46:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216131613.45344-3-phasta@kernel.org> <CANiq72kgsgSW5tPj3xA0DLhJS8yBS_uDT=xDbNE=rf8t-H8Qzw@mail.gmail.com>
 <fa1c81f58b05faccf69dce8645a337f7bd35a9f7.camel@mailbox.org>
In-Reply-To: <fa1c81f58b05faccf69dce8645a337f7bd35a9f7.camel@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Feb 2026 18:46:35 +0100
X-Gm-Features: AaiRm52e7_dK58aZncwTrkjNj-Bo9SEK7apgIGA9TqEWNRFW15KQs_C8BO6v0k0
Message-ID: <CANiq72=O4KZCLZx0iJtOC3QFxtX+g08VMt4tp+CBPbS2pPw9SA@mail.gmail.com>
Subject: Re: [PATCH v4] rust: list: Add unsafe for container_of
To: phasta@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 8:34=E2=80=AFAM Philipp Stanner <phasta@mailbox.org=
> wrote:
>
> Feel free to drop it for now, I can go through it properly with the
> list author to see what the most accurate formulation would be.

The commit is in v7.0-rc1 -- please feel free to send the improvements
on top of that.

Thanks!

Cheers,
Miguel
