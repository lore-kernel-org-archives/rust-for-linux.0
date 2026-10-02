Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B5D33A9E9
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 07:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790924822; cv=pass; b=eTlCqn4oFC9I7NRyl5Hg+MrFxaUkNtiGkitd7REX+MRjryCPPFHMHK/q6K7hhHzg73vhnHbtY8IEScIk3ivBwE7xp+l/90xq8lRfuqLABM3Tfaa5D7KAS9ryZPD7AWI941esRwkOv2Llp11DBoS/hbZfXpZM852xxM7HsRG9Gs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790924822; c=relaxed/simple;
	bh=pi+Udzy+By3sZoElReOh3poO8JLX+wgGZCDTOhVncSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l0TzXJ0wFdC01EPiTgKafHj4Eadx85Hbbetw5kf/3Ndswl/87HW55BrvPcp1IkmyD0gMZWCf1WHBB0pg2AQBEEh2WbilmCdXFPmRcqdi3PSLYpBOiOhgtHyUa6ZWrbIlmP61QlfRm9IcrnxPqdcuo69BTrdstOOl9EQFuZEpCJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+XIfWl6; arc=pass smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+XIfWl6"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-14a08c1a158so313849c88.1
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 00:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790924820; cv=none;
        d=google.com; s=arc-20260327;
        b=V02DHZY7C3NfADkgjMgRP7AdZZ5txj03x9V4SkW0xY+AxscpkHKM0GezsRGd6AMcZh
         vgDCBxPJnXWgCDQhi9cOAoWs7AncM/TIIrxg4Si+qFpc0KglGkrs8FZbldf+e5Acg0CP
         WFaRrLossM4lWD4jROPGzlHaue0SzZWw3kuyN2pUgchP+sMRH0Zr1BF+eEEZ+nHmb+Nt
         vLyCAi0cIXwEvtWBnqJRCy+mKVsXIF2dwpEUmtSuc7mrbc+7DoiF/v8QKOJsET4L8ruT
         Y3ZaZSeL3e231sXo7tD2NYfDbMnKlyhkoTI57CEywPtwID9nnvAZpJ/vKBuAZmHHOiiU
         FckQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pi+Udzy+By3sZoElReOh3poO8JLX+wgGZCDTOhVncSw=;
        fh=gZbkvl0m3ttUaci5qpUlSviBeDWaS44UslJpUDWzHPs=;
        b=WMPqJ6zGEs7RUfc3YxHK/obMMZCUqtbS8YV74najqLa7M6znZIzCCax8cg0QHebNC4
         aiHnJsd2OO9OdBuWq8piGxSA1DIXJ454ihYIgcrI9XUKo+AEzf+nB7TYiFQxFo+Gdsb3
         ANM3xWbX9rV3z1Rvrv98SNwgZURCDNAUcaQkVrF2HSNPwmjifB84mIHgiZkeOG3zHUsG
         3dWY5I8PcV/w/TIL++yJ+zwOLJ4NqI55GhE0h1QVgGZoNAPv89LIiR2x2K2PghAZtyZG
         3+vqelV6mUxvplHo6DVwyXF555Li0HbLEXg9vuT0d3euUwviTf9UbI68qBIw6tFlyuXj
         rldg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790924820; x=1791529620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pi+Udzy+By3sZoElReOh3poO8JLX+wgGZCDTOhVncSw=;
        b=p+XIfWl6LbHMie/BHkCHdP2ema89ERjaTV4fCpLKy6YZn7cvKyla1DJgQtJqYRlNtu
         oj62bYE0NIdp6ehQf3Ny/G5UYEH49WYstCoysZRlaXpB84cY5SlqEAC7whxpSZptWYSZ
         a2Cy1V5tVv9GYTWuM4lPpslqra4a465H1LJoqLUiloe9G54c0JN0ZwuUUUlnsCOcGvTH
         No74/j2D4xngRQNG7o85UVb/1tY/bKIFwtrLXWtZAWhdIFpxB9Oe8r/dQf9+Wr1n3414
         bTibqUSHk8OeVL/lkRdbY+oF+kXlnmT/jXz3jMhkvwqy1ZpBLUSVRftD6mHnbgCUW2Rj
         xxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790924820; x=1791529620;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pi+Udzy+By3sZoElReOh3poO8JLX+wgGZCDTOhVncSw=;
        b=TbMJGpoTLrMQwm7uUpnNtpisHDx6MqHn/rqMq3/yOeQ28oKH4rxMZTH9f/QTNTnWAG
         DSAOqqDL5ZZR6oN9uYCvw+dGHALq5VEqiXmnSoEvPrKZnswrlMXQgPGdChSV11+NVi2Z
         GAjHZRjELpXkRWS6sh5iSkGwWNfbcDOMleaaHN4Fj/339A1onOuu7sNtaHN43EjXfT29
         IuA+9sNbsaKIAK4Jm0dppBg6ZFQYxT35dSMqdz1I/cQYdV9y5yZ1ylaAXvoVH3YBUd12
         5M4m5VZbLYJoz5CuxZwMwqlEeC+vk3XxnxahiIxveqZKI5dD52/lJ84JtPlPSiAIsLAQ
         ETJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNg0/RC3nd5QmJlkE2GWc7+qmrTwoAHKP2twVla51GBbIRoR2q7kqEPgLg8LpiVSsWHA3nZI4S8UOMehg9eg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJJFH1IDFN9devCNWLhnipDwFvfTOOMPyptbbaG/AtnEEDAlkHN
	SFjmLvThqVFIdAzUKGCgt4WIzT7Y/Xwns0Dw/aoIrND9mWup99KEoe44uDzfv06m+vURYV2WUdk
	jDHZUKU82zZXZe+C68wGm3S4OYLoWpcw=
X-Gm-Gg: AYBFou0MxU3zm2wBA/ICsjArZqQgErfApb+61d3oKy+mpec0qW0bZ+bvBBLd6mYvq6S
	TLtGxbYZH1lDfNUy050PKRFBM/3GIBuH6FYjay7dGuvaIiKLChhvrDIpBHqdXt3kNK2LGybv88/
	NXyUNhcLi5FZHCffdc10OrgsBE2r7PS8dtJo1T1BzHRpuPCB3ucuMF/1b2WE8f/7Y0NOVeemvxS
	RQc5aMsJjU575IiAYaYJYDj9rZZRb1mi18LMgzjbZjs5iSl9ctGlXYRLEr12TL82K2wVXe6G7rm
	h9ct3tAPO/zLgHRUrRY74BEJVmIf72QBR/5YlZCtWItfD9ZhyI+6F8E5bjYyoSjGPfQR9BmsbkI
	TrL84aRji7LvF7Wx6s5iWwkPceunf9PlWaB7axcodc01ZO0OOqiC/SBRTNNksgQqtOS9aw8Fwho
	iIIoCuBELROUIPFMVp/HEgAbVDc2tiUxiZx+jOiwwvF/ELshWNsGnQxnLwj0RoZg==
X-Received: by 2002:a05:7300:4f1c:b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34f1501d239mr2860107eec.1.1790924819859; Fri, 02 Oct 2026
 00:06:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001123103.2198104-1-tomo@flapping.org>
In-Reply-To: <20261001123103.2198104-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 09:06:47 +0200
X-Gm-Features: AclHuK9aq6CWZxEjLyQFN3qCeoottkqFWF4dz3y4arkdWfxJVGxahHmXpJ6rMsY
Message-ID: <CANiq72menqxT-7Wv559u+=JQAxvucBTubs62=eN_CHCj7wtEzA@mail.gmail.com>
Subject: Re: [PATCH v1] rust: bug: pass TAINT_WARN to warn_slowpath_fmt() on UML
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net, 
	lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, 
	linux-um@lists.infradead.org, david@davidgow.net, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 2:31=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> On UML, `warn_flags!` calls `warn_slowpath_fmt()` directly. Its third
> argument is a taint number, but `warn_on!` passes its bug flags there.
>
> As a result, `add_taint()` gets 2304 instead of 9 (`TAINT_WARN`). The
> warning is not recorded: `/proc/sys/kernel/tainted` stays 0 after
> `warn_on!` fires, where it should be 512. It also causes an
> out-of-bounds write in `add_taint()`.
>
> Pass `TAINT_WARN` directly, as C does on UML.
>
> Cc: stable@vger.kernel.org
> Fixes: dff64b072708 ("rust: Add warn_on macro")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to `rust-next` -- thanks!

We should update the `// SAFETY: It is always safe to call
`warn_slowpath_fmt() ...` comment to cover everything that may go
wrong (like it did).

Cheers,
Miguel
