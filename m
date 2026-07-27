Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA28E3C0A1F
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jul 2026 19:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785180292; cv=none; b=SEbyw3KB07s33+/XHGDoEqmL4bmUzpjCaQJy1wVii/Kq71HaoxHSyyi07oVmdGZaU4nT+mDPqdmQAfQYhT74+P5Xxn1lBJQOTZ7OnWWKCTOYVShDVw2RDj3pYI2ELdYuDBRMqWJNSZ72ejSwZywL0sbqLDkhpomKbwHavcQKe8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785180292; c=relaxed/simple;
	bh=J8xfgP9hEfTcL5HLwMcdAyzynD6LkxGko0WlTarX4/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jS4UvDAXTKj8l4ECEqATenqLGlUYD4Vj0DVOwjgGuwIfiqJK05yqFxbD373KCcGYjooHs9rkKhN5J54RG5C0zhuZewvgJC7ZiNIVJkhQAABD/C1kkRKDdcC+KCEQhqFD+/Y5wYT95LPHd6wXrG1Dh9f0oheBOoETL8imx9tUdbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KF4ZuNHN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KF4ZuNHN"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cede6375caso29595ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jul 2026 12:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785180290; x=1785785090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zJFdpBhBp0OM8gJ3Y2wEmdgykqIsz6w3M3NCrQc35F0=;
        b=KF4ZuNHNHtIIFYIPiHzGOUV7VMYLAYid97t1X3Od+wK2DGKeMjYVd1CHfTfLpswIbW
         Cq2w7nPjiLTroDDrPD6gs8JD/cehMImru5hViQWgRVaLsKr2H+SqwIIICBJH7CmM5mJB
         Ft8923cO2gfbwY3U0k9uNo6Qugw+CyeSTSPK3GPqdUI13AvxgOMFO9/7au/gjxAY9o4G
         7k73cWiCU7DqWMN0Xo16z8x5S9nL3E7ar+zKoW8T0mOSumWyXXcIC5GZxWyBoE/HHztt
         QTQxxIGWknhTerD3ViUxXT/colXqQHmtoDkAs5SkHKLNoLUA2+nxJT6vBMl/YFJ1v3Oa
         ZfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785180290; x=1785785090;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zJFdpBhBp0OM8gJ3Y2wEmdgykqIsz6w3M3NCrQc35F0=;
        b=l9Fd79woxWYgnUDrMH8W5Mw3dmBO9vDslWq9SvNYd22fGbftBHbeM4IeiX8BL92y2t
         knmaxzjxZrQN9rzJ8xYU8OYeJgLzz9Iq9dl8eR10g2fc697YfjjJeSwfyFa0ckXVmBNd
         JoGme6AkKm+P6K6IHfpOnifaL6C3xt+2fVv3l9NMn91bey431kGebWU0ipyfY84+WaUX
         PwggaPRwCJoObooSzdYv55yWYh2PS0lC70SUQ3fYHovBWpPwfbggfUVuA4Jby4kBmuYX
         MlKwik05Y+5Ag/4Cv4VZH0aC+STh+VjS36kNZUULk5qtSSThpFHfG2dqQoatVHQgHpIm
         eXAA==
X-Forwarded-Encrypted: i=1; AHgh+RqVcUrb0vHw7CRpthKIBzP6Vvhf9J7O3EAAR6bIaiCatsmjSv9A5pw9QJMAh2b1pAjHK55mQyWsbVQM3ufU3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnRCxrIIxtC/I8zXpiL75Tz2OqwgJYa+xdS56eD0Elb2WnMeMt
	BJsnS70Cop1G4+phCjF3tbOG40HiT9J4JT98L6g4ERSgtCuyV4VAIoy3luHwN01cf2l42071ruX
	SrYep4Q==
X-Gm-Gg: AR+sD11/KfR1K3LdNQJFdI6+HNhlb3p/r+6cpXCJajP/n/kAgn+65u/O+X/czo9DKFX
	b2yHIS3TfjhO1dtY1VfvyWZt0lJPT2WqUzKnCbfhihXE9YxEFxaxbpUIOIPnCF/cS4yA7hmP5ZV
	OsQf8jXQ2pmtPWzQHgah5wjwIlFxoerasmAms1B+k5Sc/OVQeuxxHeBZpg0Bq96J0btk0waQXxF
	TQ2BHhjdh+SssBIDweSicwvTZ3dpRkQCbBWfG6zhkogcSQvLonK4Mi/Z2j3hzQIXUWvHH1zWjdj
	Z86KoQ488dmHOwl08h0wkYMwAsOFMEnuq6qOuIOM7YHzVoZ/Tl0dVmSrSdTsix+fJLuRYSMXnfq
	+cEyNwZqzr5h9cNKokQZEA1SF4rWXFTp0SfNIvRG4/BxEYEruQV5V/Fx9ZUr+DJez0AyydYd5D8
	rihZDt8QexiHpCcYMWEkwahUX2VuHNTg82qfIOV8ZBn9TkO6qtxL8MgLiAqVBUQjiVw+e5i9960
	O6j42HyOVvzwKF4ssLnQNbT1Q==
X-Received: by 2002:a17:903:1c1:b0:2cf:41ba:96b8 with SMTP id d9443c01a7336-2cfdb5cc713mr18629365ad.6.1785180289443;
        Mon, 27 Jul 2026 12:24:49 -0700 (PDT)
Received: from google.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533ce1f7sm3446224b3a.34.2026.07.27.12.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:24:48 -0700 (PDT)
Date: Mon, 27 Jul 2026 19:24:43 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust_binder: do not query current thread for all ioctls
Message-ID: <amewewIwdet8iSat@google.com>
References: <20260727-binder-cur-thread-v1-1-8edf2b64e235@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-binder-cur-thread-v1-1-8edf2b64e235@google.com>

On Mon, Jul 27, 2026 at 12:28:59PM +0000, Alice Ryhl wrote:
> The get_current_thread() method is currently called for every ioctl to
> ensure that a Thread struct exists for the thread calling into the
> driver. However, not all ioctls require a Thread object, so this means
> we are unnecessarily creating these objects in cases where we don't need
> to. If said thread does not invoke BINDER_THREAD_EXIT on exit, Binder's
> Thread struct stays around until the fd is closed. For long-lived
> processes the Thread object is effectively leaked.
> 
> Furthermore, when the BINDER_GET_NODE_DEBUG_INFO ioctl is invoked by
> libmemunreachable to ensure that objects reachable only through the
> Binder driver are not considered leaked, this is done from a fork of the
> process owning the fd, which means that it fails the group_leader check
> inside get_current_thread(). This results in EINVAL errors for this
> ioctl, causing libmemunreachable to report a false positive memory leak.
> 
> Thus, do not invoke get_current_thread() for ioctls that do not require
> it.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
LGTM,

Acked-by: Carlos Llamas <cmllamas@google.com>
