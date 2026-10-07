Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E10E44A3F9
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Oct 2026 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791381325; cv=none; b=HDCSTfT8C2s1uQnqh7xr9l7UOEXdlIC2H4t2LKmYsszmkWPS16BIY6xzVOePdGFCJxxqBRE9IgixGlE7FStpvf4o+hsV9Pt9nbTfFPqxpcyWEZAB6PvdSQtvAP/4pHe7CsPdINLP3nbWPbnIWczzXn11LCr6GudIpCPcQy25sas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791381325; c=relaxed/simple;
	bh=AyfWggmNPmbkrIqwVRW1/5aLbvyfx2Z3Be6Nho4kKXE=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oyKLvRRtm/HTuaZ9f2T/OcWak4VdpIJebq8d5G5Ceh1Nm4l6Oo10myp8aNz9GcOn+zWng3U+cJVQoF2OgtKuQ/PHhb3K0SkalckabcDqJP+JXci+twyc/ozQoLiy5Ue9DPuashqpUEeNmLJWmIwldSEI8/rHeSnzUARVrahH9YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=ArqVN/CZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Vt24a7N8; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="ArqVN/CZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Vt24a7N8"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A15DE7A0279
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Oct 2026 09:55:09 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 07 Oct 2026 09:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791381307;
	 x=1791467707; bh=W528n6zrSGBTyysSQccpnBMV5XSNaif0OWgxSZYmRMg=; b=
	ArqVN/CZ0Ma8GfU1AsrfYz70Zrbc6Dl4BVdbH6OOO4uIZvD/XJghhAw5cMdavGzS
	dPpgGNdTg3ofJsfOg5CRK/SjCW4n0IMXgQmChobLoV/Ubydki3QRJJz0kVIEb7am
	j+xXBJ/x0uOZeNjkto6Mx0+R9d2eksP15Ka9+OOC4Pi8Ew8kb6L56ic/ZMFbXVIK
	Jxy53C0/oflnqxdXkgReANuhKp3QkHCHzaNcIBn4iEM+tG+9YC0lZCf/LXXJ/vVF
	KAou6XxIvZqeLEeLox/869OzqTiWZuk4awHINjnmzBTa0CG/YXOlnIHmUuRcYO2v
	nqt6S+2kHJ0gPEib8z2F1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791381307; x=
	1791467707; bh=W528n6zrSGBTyysSQccpnBMV5XSNaif0OWgxSZYmRMg=; b=V
	t24a7N8PUYHoGLmDHKYX+xAULlNZveNUJiQtShl9cXQRDdPSJ/M8lggxFfnubUHP
	fKEsuo2a76qTEQglPQuxjhYDxFs2yAPrkc1/4JCOBJYJSchgAoWA8Kz4lRKb5/tN
	0Et0lma/p5vvgBIOsAHdmkqRsohAOR285wNoBkdHdC9ovDAVN1mD0NFswmV3dUty
	+px1Ti6EeMT+1VM6ENICfQ9k4CQg7ikXqfjEVr/t4O8Fx+g0Cr8xGIL5UE6rgQWX
	68Up6UqeiixY0x2VdQMum4vvY0TdovEAY99ZLp+mPE2/gSxtsX3FWTBDibiTIBwt
	lQwlHTv4onLK4tiT+2TYg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791381307; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:F9DE2epAZjw5N4kescauqO+WCRiuDF8QFE0A6kccWC6DulV
	XGGMK80OtKu+Pk52TFIGcAxSlXARH0QA7raF8HzXuSEjIwHNdnRmzgNA1zqQuUH4
	ugT1m/sJehoHMF4GAdK2z0h7vTVais2axWf0+397HAfQK/Q2BbMMhVtElkB70f2w
	GS6q4Jt1V+4LywZriiBVJc3T+sBHyO1wn3OSwxWIPzviqev2lvp9Bw0L08UqRhun
	DPvStfKuL+6IADOrCjagZjxb+t56E8n7rGb8jkMqnP+JV5HTfU8W558r+WU8kNvF
	zImR9N4OyUgNkwRxPxQpaw0APg6X/He4dkreISQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:OYftEJIgtg+thmG7JBbnAsXUp+blwsTkHPUAgeZHtAc=:AyfWggmNPmbkrIqwVRW1/5aLbvyfx2Z3Be6Nho4kKXE=;
X-ME-Sender: <xms:O0_GagB-a6lvHXZlnCP9TbzrmDBX2j0jcZntAuO9sD3Q2Ma75LeCNw>
    <xme:O0_Gaqu2aqD_SWWG3DUzL4m-o92gfzqDuzQBKkCNktD9Zeo6YACB1WSQgM7Hk6ut2
    AljFmuNc_vVoC97__dwwlTFxEC3Ii7hw_Uw3t2oaMhl5nVxkOUtBOpQ>
X-ME-Received: <xmr:O0_GavIqrGbg4JCCSgxd-EUFzBon6iZ4LZovbx1OmSD_arSJC38tXqQFhE_-2eN2ljnrkfeEbaUsuMbA-NZfEkcS>
X-ME-Proxy-Cause: dmFkZTE/dAu/9FsYPZBKq47bQd+Tnrk1jJ0CHCbsZ1UVndExek50LgtQf//orSdRIhuOqh
    /r/06mCbNZRn+uEpXv+rJOrDJAFgY+HD0Zin6yLgFSoS6CBHz8kALOX6JTXDOHEpQKkXvN
    uwQA4o9TfIzl9dEPwsI5m/g7Kt4u/tC28xHrazfgyaEGPqiZwbixGXEHlU3HeCuLonPnsD
    SdEOY8iKGwsnZw/Aex3bP2OsSt+7MWPPLGTHf8RqFTAasFoYxoBsHN0YsSIZm+M3C8VieC
    YABrNLPAY+5ZlWVdYOijvl4RiEipdYKRnRyTnc55trsbuhp4yy4+99+sdxLWYbeWdM1Sf7
    PpUsr1OwPc6+lDYxNKjUfGB7meq5qIGvANm4mHPsEAdEEJUYXcvwRrex1sHDWFRHnGhXV2
    afOsN823IHLjzfSgUmvzHwXyQpCmWHW+9NqPmJFjMJ0o8PjL0IeV+lRl88ByuD9Mmp03Ik
    qM5jF7rPoFatYW2eBRvXla7yIhmh20IslSncB4fC2SLSY6IGE6ujt8NGx9y64X9sKKwEPc
    KdNJsThSUjNtF5ZfgdagFHu87slhsNHOc9oTOY9GJr/801sHtTnVWMw1M/XNvo9wPBdBg0
    FXsur/Qpe3F0xTXxDMm8KLSSkgY9zBk1/8TLMinxIOmW3rT3C1vQhRUZm1Uw
X-ME-Proxy: <xmx:O0_GahY7dDs6JmX1nIsvTgTdEynriqZSd7hqRjkoBD589PkJ9qf9yw>
    <xmx:O0_GahAwKUGAzSdSoh9GSBITd57JwDZa0OYhwALasMElyKJbR9e5fA>
    <xmx:O0_GarapXOUIyIz24uk_LEAylDu37LHBSvF0m4jVYsL8_9irfN4wyw>
    <xmx:O0_GapnhgADD8oWVpzt10QyrgND7snnawLcF0yLGqI5YxFIRkGjp1Q>
    <xmx:O0_GakW_QrId4BBAXtIVU32MRPKETCP2xmVK0m_ZhDD3hivNJF9fZcsF>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Oct 2026 09:55:04 -0400 (EDT)
Date: Wed, 07 Oct 2026 22:55:01 +0900 (JST)
Message-Id: <20261007.225501.2303547436453055941.tomo@flapping.org>
To: a.hindborg@kernel.org, ojeda@kernel.org
Cc: boqun.feng@gmail.com, fujita.tomonori@gmail.com, frederic@kernel.org,
 lyude@redhat.com, tglx@linutronix.de, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [GIT PULL] Rust timekeeping for v7.4-rc1
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <87ece1eirv.fsf@kernel.org>
References: <87ece1eirv.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi Andreas,

On Wed, 07 Oct 2026 15:34:44 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> Hi Miguel,
> 
> Please pull these changes for rust timekeeping for v7.4-rc1.
> 
> The following changes since commit df2908090cda368b01ff43709f51890076c56157:
> 
>   Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/rust-for-linux/linux.git tags/rust-timekeeping-for-v7.4-rc1
> 
> for you to fetch changes up to 2ea0119f72dba597aa8a98cbdb72c564bfc5cb38:
> 
>   rust: hrtimer: document handle based design rationale (2026-09-29 09:22:30 +0200)
> 
> ----------------------------------------------------------------
> Rust timekeeping changes for v7.4-rc1
> 
> This time we have a few assorted changes:
> 
>  - Warnings when passing out-of-range inputs to `fsleep` and `udelay`.
>  - Rename `ClockSource` to `ClockId` to better align with naming conventions in C kernel.
>  - Make `CONFIG_HZ` value available as `bindings::HZ`.
>  - Add a conversion method to convert `Delta` to `jiffies` for use in timeout arguments.
>  - Add implementation detail documentation for `HrTimer`.
> 
> ----------------------------------------------------------------
> Andreas Hindborg (1):
>       rust: hrtimer: document handle based design rationale
> 
> FUJITA Tomonori (3):
>       rust: time: rename ClockSource trait to ClockId
>       rust: bindings: set HZ to CONFIG_HZ
>       rust: time: add Delta::to_jiffies_timeout() for timeout conversion
> 
> Sang-Heon Jeon (1):
>       rust: time: warn and assert out-of-range input in fsleep() and udelay()

Would it be possible to also include the following two patches in this
pull request?

  rust: time: make Delta::ZERO generic over the time unit
  rust: time: add Delta::as_jiffies_unsigned()

https://lore.kernel.org/rust-for-linux/20261002050428.2746277-2-tomo@flapping.org/
https://lore.kernel.org/rust-for-linux/20261002050428.2746277-3-tomo@flapping.org/

Three patches depend on them: the workqueue and condvar patches in the
same series, and the serdev patch. All three change code that is
merged through trees other than rust-next. If the two patches are in
v7.4-rc1, the three patches can go through those trees in the next
cycle without a dependency on the timekeeping tree.

Both patches are small and straightforward, and Gary has already given
his Reviewed-by.

If it is easier, Miguel could also apply them to rust-next directly
with your Acked-by. That would work for me too.
