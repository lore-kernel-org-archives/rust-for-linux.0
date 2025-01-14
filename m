Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5E518952C
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jan 2025 15:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736869133; cv=none; b=vGuUEgytD79XK/fO1YO5Q/2KDI5yIWaYpfiIdJKcU8uSttYzLmIJ+Nc9i9m/UxnB6UaAGPZA8FfdPx/3pxfe0pSvAhwiN30Q6oroIGd5VvuIWwuK416phpWG7PL9WrQI0D6zHeUXmVzELqxnYxQPt6oybnS1BGdHsMnIKk2bvlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736869133; c=relaxed/simple;
	bh=qWwRbalVlFVb5ebvQeyhAkWonrhpzXMr3MB2kUA1rHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAndTnGsnJkawKzkEwcPe4JEqx+jg9b2WE/gvK2q+Yn+UHRB7SrIyU68EZ8+Arz/zVjZKrw3y/rKZ3/8hr9BsEyiDiIlKSX4OQpVYrBmc+qUI37r3Kx9XzhHttrSGp5M9WiWcbD4NUPaozzU6ql4bN7CiKxjlg9btNnDBwcbDNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=SOGy2+D2; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="SOGy2+D2"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9e44654ae3so906730166b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jan 2025 07:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736869129; x=1737473929; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ODMaixCykybFpyXfXOh5SU/u+pXNOEmZVe97XLIWj0s=;
        b=SOGy2+D2mM9MHogYkRArEle3UYBbwch8TKIj4a0OXrEFzRjr4uHfB+ytOf7c/NkgoC
         vGlMhNs3iWkJE7Noeha7dvy23sN1TK2a24sL7bxdTZaoDaUEZbZe69C+ltsnh5bKmz4i
         Xf1B7qoenamgL21nHncTBOQC6ah9u5tmCfIf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736869129; x=1737473929;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODMaixCykybFpyXfXOh5SU/u+pXNOEmZVe97XLIWj0s=;
        b=DguQerLGiiPX2O7ltZkkGLLo635CrRHII98/OsP/BKViFGSamtqe/ytosIpcuw5kn7
         3+aMy8PfnjlxI2RoicG8FAGeInaDuK2K6pAzA/HqDf1Jzgq8QFfa+X616o6s0XDKJSHp
         6TNKIieRh7RAktp8isHrS56eCTgDrpl+82ib7ilwRqCqC05lOmj8Kt4B7gK+kUle0kN2
         +dFD5hwhIjMEwOkE9UIkSFnDpr68O9Zm28rO2+QCB7IWhgcVv7hRrXFu4EW4547HVsiJ
         7+KBeXWGqaDFAEesSip3WAmNbimm93gMfBNY0wZuApUtN0byoHFBqdmbB8nsQOPkd8hY
         7bbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAAVxq0H/cIjV/xAyuEwGmtgHDA+/0N26/gbXe340HyZ09X6sJIXtDwYVW8bWZ2Gyt5RkbDlC8I7/A2RLnHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGVGbs4HcoiakgSRKTFAlF+79LHYI74ZD03tP+aVYyuPvxoVye
	qIWtUkEp/t9xgMUDjR2PwlOXZi05xVkHZyXpoNL38s9C1b+SjLm3aF2hJS/CqAA=
X-Gm-Gg: ASbGncvZ9w9OgHaOjqSBwwkSn1hB2DgnllAZ3z6YM6u1kr0y6vNC4tcApBGLK9Q2hpm
	Jc9wM+t0pQdqIz3xPprNdH/ttvhC6ESMRB3xOeen1rGWNm6TYyOz539qtvXPZXPjv6cyNnKkNrl
	+y+zELwRG1NOnocxyPnHn28txYBkZGAXYZCWuY9W4DLKOQYVHGgnZdc08NeHk+LMzebU+kFrpJE
	SSBZ94zwG6avjN5saDEXhm8vY/ZrBIQ1T4InDcQ2JxP4KbDk86Ln/iFh7vSXnBFPpKw
X-Google-Smtp-Source: AGHT+IFKC0qtMfswjkUHdUbLXJ8Fzz/7FK60lz5r/sV1+p/qljFpLildKmIql5dlVsd79+eSBlA+SA==
X-Received: by 2002:a17:907:3e9f:b0:aae:bd4c:22c0 with SMTP id a640c23a62f3a-ab2ab70aeccmr2271121566b.19.1736869129214;
        Tue, 14 Jan 2025 07:38:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905cd8asm641773166b.7.2025.01.14.07.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 07:38:48 -0800 (PST)
Date: Tue, 14 Jan 2025 16:38:46 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
	mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com,
	cjia@nvidia.com, jhubbard@nvidia.com,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@redhat.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [WIP RFC v2 33/35] WIP: rust: drm/kms: Add VblankSupport
Message-ID: <Z4aFBhzyBrq48aib@phenom.ffwll.local>
Mail-Followup-To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
	mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com,
	cjia@nvidia.com, jhubbard@nvidia.com,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@redhat.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-34-lyude@redhat.com>
 <FD0FB134-5FFD-419A-9B66-85ED2EB6554A@collabora.com>
 <d35e7f02b1d123fad8d4aefa494d0e83424c6e96.camel@redhat.com>
 <Z4ZzkBDCryk-NKPg@phenom.ffwll.local>
 <CANiq72=M3=0rcTfQS9Gch8NeNyrpXb91t-z-gDBSDO8V-Bh5gQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=M3=0rcTfQS9Gch8NeNyrpXb91t-z-gDBSDO8V-Bh5gQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Tue, Jan 14, 2025 at 04:04:41PM +0100, Miguel Ojeda wrote:
> On Tue, Jan 14, 2025 at 3:24 PM Simona Vetter <simona.vetter@ffwll.ch> wrote:
> >
> > Feels like trying to replicate docs in rust might be dangerous, because if
> > we have to keep really detailed and nuanced docs around in two places we
> > will fail.
> >
> > Imo would be better to just explain how this maps to the C side and link
> > to that for full docs? Or somehow include that, but then all the
> > hyperlinks need to work from the C side kerneldoc or it's again
> > incomplete.
> 
> Yeah, if things would be duplicated (in a way that does not add much
> value, e.g. things that do not require linking to many Rust-side
> things or does not use the examples KUnit support etc.), then I would
> say it is best to do it in a single place.
> 
> To do that, we already support the `srctree/` links that can point to
> files (and in rust.docs.kernel.org get rendered to git.kernel.org). To
> point to rendered docs instead of files, for the time being the best
> so far is to link to docs.kernel.org directly.
> 
> Then, what I proposed to upstream Rust is to have a feature that would
> give us a way to have a bibliography/map of links that could be used
> similarly to the existing intradoc-links in Rust docs. That way,
> projects could write something like [`struct my_struct`] and you would
> automatically get a link to the suitable URL to the C item, or
> something like [`ref:interleaved_replies`] to get a link to the
> Documentation/ rST reference and so on. It would also help to have
> common links without having to repeat them everywhere. With that in
> place, we could replace the docs.kernel.org links (though that
> requires rendering the docs, and we heard from at least someone that
> didn't want that at all...).

Yeah I think something like [`struct my_struct`] in the rust doc to link
to the C side would be best. Dropping full url is kinda nasty, because it
also makes navigating the source code itself harder. And I fairly often
read the kerneldoc in the sources itself, not the rendered form. But
that's maybe more a developer/maintainer use-case, since generally when I
read docs it's to make sure they still match the code, so best when that's
all close together.

> Then we can also work on the other direction somehow, e.g. sharing a
> way to render docs properly for both C and Rust. I would like to work
> on some of that after the build system stuff.

Hm I guess the other direction might apply for when we implement helpers
in rust that C drivers are expected to use, like the qr code generator we
now have. I think at least medium term most of our referencing needs will
go from rustdoc to kerneldoc though, and not the other direction.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
