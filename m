Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794836895;
	b=QpZ97inbS/qyoSDnmsuznWwrdPog3yRO+a+CDSq0XpvTNWhuozOdPDomMG51h11YS35D
	 17d933MYS9GET2wY7mnMDM1N5xX8Im0WBEpIE3nKSjHbDIZ0zPkRc+ftToux7FxioKWxD
	 wV33dfy3ijpSiNK1cRIUwws6/ktdn12aepTuilmS6lo9eRPWHY8ORnw0sipazmnc7gvlH
	 +YkOcPx/RBZ5LIg1rMZVj+7gLkwWvXF/Bbr+1d6p34KjpVEbjn6a+cS9zxljwMLxL/8wi
	 MQS+ttzla25uwXN7ImsiPKKbaUjP99w9M/2n0T1ja5w24qN4u3zQnCukjpNKIUcB1yQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LcwRAV6Cfn51LvqO8NBKcDJcN92DAtlraZaE+7y7lYQ=;
	b=rQHcJFPapRUtbJSy7gfv205+Dp3RD9fMD0eCV+5XPPM4ZWAa6gwstYi1kva0I0+4D2uV
	 0krVaNDwcTuMNlXP0K2HH67p956Iv3ojz+Ht0sTNg/Un/4tLsxnBKlejUw9zwhTZwqTZJ
	 d7L6wOpNwWy9yIrNVrmRnRbJHaw7+6U31JVGaG8jB6Jb/mlGI7DAuXTdJgCvehR7jya0G
	 W6j7SXcuR0l4o2nJVR0g7uLMtqLuG/Ivl4YgX+cXnnic5IO/BZJ+ZprEOpISeQ9pjzN/u
	 Y0TBTrYiKkU8+eNTWiLv029AqfFn1HaLSa7YdBsDwBSG4Iryf4CvQMFfIm41Ntji14g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LDjM7ouN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73826606A895
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 13:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73826606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LDjM7ouN
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-86156cf8a7eso3563702a34.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 05:48:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794836894; cv=none;
        d=google.com; s=arc-20260327;
        b=j9LXLEFKUcndEzsfyW1Qh5QRwufzGG1Uz/pc8n58a32pTmTier26MHrtglnu8ERkFO
         zLdgJrmYyJNXPQ+x/7yblL2/ecVSdtWTIhQ1DNyALyhQK2FDUHHORvAwAPSK+zXSj+VQ
         cam9G5u2bgnLQ4Ry8mDWQtFzqcDK1lQy2eD7Ff9qkeNniaPAvF7p0BSvnbcue/8yQidk
         RyAZ9KW+iXxv8XDx/D3R321lD9jiTeuhEVCznC2OK4zrk5xj1+JfQVj2u+nT48T69ldu
         u5VXLwJjNza3dQxzztqEfvjgWMd2viTIlj9SwjBZVZKJReBvYQz/XZpZK+SZ50ounkIp
         JHvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LcwRAV6Cfn51LvqO8NBKcDJcN92DAtlraZaE+7y7lYQ=;
        fh=FoZxhO3e4pUUxaEe038CNmpYfsVk3iR9fh/KR8E0r64=;
        b=LTjogEidleE/KVXBbLIgn1hspvtx0bo+vy1jy/swr1ITRSdgfUdk6cYrX8IMe5jQm1
         7Y+deW3CbgFNeR0BpuW05mL+DgyPsT6FGYV2ol05kC98MtE6Xhz0Fvx2VYBJ4eRg6Z1T
         yBGZrkR1AOr03ZtAObQqMP33sLCXwQQjsruCt04GX7NBIYoz75SnotI6nHii1Wl8ET4H
         zkAt3N+ijG85M3XFr0p8abh2IUQdpoIOCmIT9N22qYS8bjWipF8RUj4s4mFRpZ3ywm0Z
         XNnPAw/lJINnSVWtNYSM8jPBh2gSz4OY2q+H5vCC8/KeNaEKarZGqGGVX2B9fB6TvTiK
         Fc0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794836894; x=1795441694; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LcwRAV6Cfn51LvqO8NBKcDJcN92DAtlraZaE+7y7lYQ=;
        b=LDjM7ouNloY/7f4uugMx8sCMqrD6kfbljijeB4PG+tnLFVO+oAN/fiqW9jdms0z3pS
         /zmH8zyb4dNbBmmMtJfIR7BSJN86jOe5aP+nZvjRwF8TdpO5bCQMQSWyawa0rYSy0JYe
         ADdTvKPDNphWiPS9zI4SG9TcYJln7akD9XYGepcjJDAUM65KvyB0z1smGYXH9XQ2Lyec
         Do4sgLYXnWA+LwoZfmcn+E/qKJigSWynCPT8kcCdMftw7Q3BId5OdeSDzv3AwEzwAq2C
         s2hmxV2O5lOCQInQOCTkaPuLjS+ezhoWJKBtCMM5hD3IGE5/VbIM/0bFYFZh1ijUq1Mi
         mkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836894; x=1795441694;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LcwRAV6Cfn51LvqO8NBKcDJcN92DAtlraZaE+7y7lYQ=;
        b=f3gkAs96AcEzg1fVmb3aiIHoaoC6RXihlC1GP9OeKdbRuQ6g5NV8UtUN9bfImasqRg
         EscaOXY7pHcTMNYzT00qz1tflshseBvzF4DJSZBD9sJxp7W8BgTsWl8Dd89eMEJFg8Rs
         8dwlHFwbhLY3ddI9NBui2xP3RUKEkPGhUsjv5/EwDsOnAOpS+Dc8fFjTIgZBpBrEv+76
         0lw/NlSdiZqpQ9L+z9pjr69nF+aBD0m9c/QFBvspYsMc+ycq9mmYgzeTYlF29RmV7oNe
         nxiUMnWkGsZPaiJ8aRahL0esH23gKOpNxAX/KydbRlmbLA+eQvLGSxFuEddDfT5r7OWT
         Vagw==
X-Forwarded-Encrypted: i=1; AL+hErHUVUyf5o5CxYeeOOFKF41k+CEF4ZloDYEE3fC19PZUfSr/1DkjxZcycTBon/15JAV79wn1YlfSAFvcsa/qEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9os02A9jFWCjFSignDznq1PTfdPQWzei1bcq8xqZ82l/qIwISO
	VMB8SyI7V8cELqE6sG5uKt2lFkxanc4TeX1Z9x7Kx9anutQ1aISZ2NP1CO4rHDCVpI0ZIjOo8F0
	zactCJUE6mr48ppoG3FOM6iRKIK9ubBk=
X-Gm-Gg: AYBFou16+wXZ+SPlZvdIrmcxfuFOBVV87jsUHecO2V7G5D6dlsj5p0Ajs2Sfl/wQNJE
	Vo/JEyidgJy59hB84wtPi57qMfJAxAaowege61a+4HO/KdIjPtSQ8UiOiYKI9CytEWNEqtmGw2r
	dHAX4jQ4Q/7u1whSQmSJOxorFrEbxiNnJCcZ6AKa2SMi2iYdoocm0z+eqqI79MCixo6fyEvu0Cu
	ZhchE0lBftxVsDzFMvVCEqBa9o7wAFleL3DlrX3gw26HCZXAIIoLwXQ1aefAhRX3SeVTbbtv4Zr
	Y4yK0GV0b2+S5XkRM+gx1F6OuCu7F8FW/aaxwNCMXg51445iSf437B60GbPdDNZaowK8s2toETX
	QcF1soBbOoiEU7Y11bbAHhn9ihjaEQpU7/rGsc3ro3WN4pqUSkpEYov2XJNVcb0UCy7lu5LGNlo
	55UrQQucLKt3Lt3TrV6e4KQ4+QgqD3RKQsqdiOLWIrNDrNFO+F7xzcmjVn
X-Received: by 2002:a05:6820:2485:b0:719:d9b:d750 with SMTP id
 006d021491bc7-71ab5228714mr4375156eaf.38.1794836894278; Mon, 16 Nov 2026
 05:48:14 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-exp-phy-rs-maybelocked-v2-3-8fa7897a0352@gmail.com> <179481441455.3136.11985756118593625944@kernel.org>
In-Reply-To: <179481441455.3136.11985756118593625944@kernel.org>
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Mon, 16 Nov 2026 22:48:01 +0900
X-Gm-Features: Aa3M54qDodNhNTwL1i0nBiBJxcrabpOvbxYPWu_JZsDXPNfRjaemdjKWEiiohJ8
Message-ID: <CAGAB667OsSkw_iKDqVwjJjWvwWoz5fSY7Cy3DUU1nFnWnrhaHg@mail.gmail.com>
Subject: Re: [PATCH RESEND net-next v2 3/3] rust: net: phy: pass a MaybeLocked
 device to soft_reset
To: netdev-bot+sashiko@kernel.org
Cc: fujita.tomonori@gmail.com, tmgross@umich.edu, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, andrew@lunn.ch, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 4:33 PM <netdev-bot+sashiko@kernel.org> wrote:

> [Severity: Medium]
> Is it sound to call genphy_soft_reset() on a Device<MaybeLocked> when the
> caller is phy_mii_ioctl()?
[...]
> The race itself is older than this series. C drivers that use
> genphy_soft_reset() have it too, and phy_mii_ioctl() is documented as
> incompatible with the PHYCONTROL layer. However, this patch is the first
> to call genphy_soft_reset() on a MaybeLocked device based on the new
> soundness claims.

As you say, the race is older than this series, and I think the fix
belongs in phy_mii_ioctl() rather than here.

> Would it make sense to take genphy_soft_reset() out of the generic impl?
> Alternatively, the MaybeLocked/Locked docs could describe the exclusion
> that the unlocked callers rely on, and note that the phy_mii_ioctl() path
> breaks it.

I would rather keep genphy_soft_reset() there, since C drivers call it on
the same path. v3 will document that the unlocked callers rely on the
state machine not running, and that phy_mii_ioctl() does not.

> [Severity: Low]
> This fixes the lock-held SAFETY comment in soft_reset_callback().
[...]
> Is that still accurate for either of them?

No. As in my reply to patch 2, v3 drops match_phy_device, and the
get_features comment will rely on the same assumption as probe.

Best regards,
SeungJong
