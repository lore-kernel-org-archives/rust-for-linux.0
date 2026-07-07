Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3472E7360
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 13:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429470; cv=pass; b=RTjLu4GXrInUISsH0Q1j0t+Ay5njmFsVa2LDc+eSuz+YplHErCIfGBWBPLChWFLJ3mmOSOPnalO+btLC8fFn+MLhOJ6eRfR7gtEvYiIX8khwR8b2vBq4jQiCiQV0I+nE6IsnJgOHceqahyO1Bye4qeM8PjvfOI6D1WKebz2Um+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429470; c=relaxed/simple;
	bh=TmPGIYAzJvC80RsuDMRwEJ1EsP9UZtxlgsFYi2qUwwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oIL4Xs7NdN4HjYidSHuKzQEec1ogXHUOAFg07YrBtRnTzRVw7NKlRTpV45eEETQx18aRuv8xc9DCcR93rvMd8JMxUf1xEwk+GJu675vXIPxzlFS4uQjvPeCAayfE/WaixbsNHYNdNE+ES+Hd/TqB5IIaK28Lz1d/Jb+gaUf/VjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nts12kSM; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nts12kSM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so39565575e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 06:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783429466; cv=none;
        d=google.com; s=arc-20260327;
        b=dqxkBUK377t4Dgyc0W7Hc74wnayZxNcUlbkO19k+9Fbhjc5Yc0jf8cen33OE+gIdsX
         b7oSUjwLfkRA+hzrrSoe5UZ8Dk16qxLC2VPI8luru60qA1DWr32gY5M9qANwz3R0HfMe
         zzHENdOJ8A0QAulHIaQnrM2HUPYJGty8f4mOimYm9sB7rK5SnOikn02C7YHGAICuh0il
         xcwdAo6A9JtoUhdRaSzyCZLkecb7wzXyyBejPXucivUHxXfyOYMgWXAc8CZisD/lYYgu
         ZGLvWy49LrJ+egVJAyf7oH57qYQtUkYuE79ofl8LlYnZnvIs8XR51GsctVo/UUmg51fa
         A4Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kMZTTwd8MYpbLMhgPf9wJy+JM0u3tngYW75375hm26s=;
        fh=8WtPmK+1m0HJpbdtEuyf1hMOFp2EIdoj7VpA0LkMmTI=;
        b=GH7hpDoIDmjtLidfHWB9y7ljHaBB5oS8TGRuDt41yos+vuHtgwtguQIBJgXXlZKHNe
         fg4e1aNapomBty9EUUSSr8q+Yx19ApBNVLWc092WP/+WPD1nxPM9DTqbd7AF4bvcrttK
         66oFVVZmSb0m20jWchIoUmhF56OLD6IwS7/9D7oDOOIdsdYAnG66Jt9Rv5NzZOzfv/KT
         A1CzvFYO//ZD6aOcbkSlFOimFBywOib5Kj98bPrQkL3YAJw2q7hoAvIhwYZmOsA8zlf2
         NdoZGqb3eE1YvXjSzR/U+x4M+j//BGsbh+gJn5b+Zq6Aq+TlWW8okVbWkMjAYjCejVKD
         C8aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783429466; x=1784034266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMZTTwd8MYpbLMhgPf9wJy+JM0u3tngYW75375hm26s=;
        b=Nts12kSMv14kT3Mm7Kxs1r2f7tWqlEGnFU6tFoIeMP51PoarIMC4pShI/bvjl76EtK
         eT3KNRKzth5yyVfwhc+J3Og2gPsHACsw6eydKUS5ZEXruyJhPCzRGdCZ5eoisZKHSJY1
         oMlspWCeU2jv5eRZ6PZLiMuG7a3rpEE6QmJ2pvzGxrOvoe8aefU7t91JcO/P6Lun1uI8
         U5OMIwYqYtEHjG59SmrqN3VhGNEwmI5aLMpg6GP+FLSH63i6poR2wbERKVFFH90DEG/a
         cSbPa49XXsG5KTzY0dPmu5qDvEdnmS1UNrUq2X1hTNzhd/REC6s0q2GpWCJNnzPRejHJ
         XDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783429466; x=1784034266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kMZTTwd8MYpbLMhgPf9wJy+JM0u3tngYW75375hm26s=;
        b=sfEXBTgnbklryg7W0UoVHKjtb6mZgHAJJJVcJyh3M7QfoLqj16DBcuyLmhYSqlmbza
         zGZzEOwqaktkY6i4RZGUDs2MO4DDBHboqo2bo24M8W42WZ+h9+0ctj75IbkhTibZ4LW7
         tbFe1vwMHjkUENB8hVK3YsrcYmk79z7otNgfNj5Saz/S05VCHX1NoisfFbKdhYSpEVb6
         gTVQLoedS9XpS4kD4Z7jO0SRK+mkLrpBc0N8l/gS8IjqHM0lXuQLjyQPr9vRjX2/zFIC
         biSZx2P0/FrSouNzIvjlJ/cjUNqxQuPVxX6yNfYPWH35lSzH/bSDsO2Zvlfp/5y90GHi
         D2aA==
X-Forwarded-Encrypted: i=1; AHgh+RoZTzEPUXElrOIWVpiJibhBmbS7HNx56IXhmXi44+qrza/8z5Me6g1/K9CclDDS+Zkp+/ktwlzfj5hsLpMwCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeejqvVoIgIDKWyJFTWDGB340Ulf+2+rSONd4a25ovUl6b7P8m
	lTDdKPRZZ2gkvpJNLwPymAdM84YBKws1Ftwb65AjRf6xTxEiBAb20sZDgWOVoj+baI4VpB56HxX
	cehIMM/PfzariNC4J6sJUfF2b06d4Hocn4PbhmOBY
X-Gm-Gg: AfdE7cmDqYAUkHcRbBcTqytJ7KAuHP8O2cwmpYpjkrX1MQm00dEF7XYl2eqDlDOOHnz
	SQ18Jm6K4B7uHKHhnAD63aAqHGLtugCao1e8rZSGcnayslLYOvTBV8QRp5YBSEuS8v0geOvEJxi
	N0fTS5vmqDQTux/kOc1/TF6zLnGK10kUxxpVnhUmULyGHw8XOnB+RLTbLJpHtchzIpdLde1XT2F
	35O/znaRIoXJNQ5PgOaA7p7DmgAY3fEPvvMa3y6e0Bkhmh6T1yDMWPXW2YVOuZHK+2/awG3Xm4F
	be1lTHm9KIbsV4PBvVAqzRu4OKE=
X-Received: by 2002:a05:600c:3e14:b0:493:bc4a:e7d3 with SMTP id
 5b1f17b1804b1-493df0a08d1mr56240095e9.39.1783429465838; Tue, 07 Jul 2026
 06:04:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-unique-ref-v19-0-2607ca88dfdf@kernel.org> <20260626-unique-ref-v19-4-2607ca88dfdf@kernel.org>
In-Reply-To: <20260626-unique-ref-v19-4-2607ca88dfdf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 7 Jul 2026 15:04:13 +0200
X-Gm-Features: AVVi8CcTh9Rs6YX_7yLE2pYLhG0EOfuYJdmTfdwdI6hvKkhrcisIrByGWFuDPNk
Message-ID: <CAH5fLgguLAQG7mUwD1NPECYSsPdpPD_tLskU3NdwLZhKR1H=aQ@mail.gmail.com>
Subject: Re: [PATCH v19 4/8] rust: page: convert to `Ownable`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 1:56=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> From: Asahi Lina <lina@asahilina.net>
>
> This allows Page references to be returned as borrowed references,
> without necessarily owning the struct page.
>
> Remove `BorrowedPage` and update users to use `Owned<Page>`.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> [ Andreas: Fix formatting and add a safety comment, update users. ]
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>      /// Returns a raw pointer to the page.
>      pub fn as_ptr(&self) -> *mut bindings::page {
> -        self.page.as_ptr()
> +        Opaque::cast_into(&self.page)

cast_into() is mainly used when you have a raw pointer to opaque. When
you have a reference, you can just do self.page.get()

Alice
