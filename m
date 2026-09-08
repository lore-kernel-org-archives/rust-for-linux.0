Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772C649CF37
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 13:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875132; cv=none; b=eAv9df1wovJxnwe1PWYhj4p+Hgq76use/lG0du6C/4shMuP6Sv4MG475Ui9A/uB4iVOPH4737+IpAhCLtGgExLe9QxVdHKyX/4tr4tcmjH0Uf5Es7GIlBOdsakm6G/LHvxTjPAkOa2sdDQ0QP1LS0z+x821uuPS5dvwiVUXKWCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875132; c=relaxed/simple;
	bh=6w6s0ug5UOPVdsxgvUfsiNA99gSju60RMeWmxNRkB6E=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FZ0DIPUvvm5cWkARUQA21kUGh6TjElv0u8ri8x/oJ3z/HTV57m6ZHyQsqjDNj6awWjrzm/pWP0XtSc9Fb8F4mqq9Up63xh5gK/2qix3bJusP2XtMo65WEImD04q6KRqLdLgR2RF7D3T+jPdh3fJo3FoaT2lIusJZy0RC6VQtsKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=rsxXIoWW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ChwdEso1; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="rsxXIoWW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ChwdEso1"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 1B28E1D00082;
	Tue,  8 Sep 2026 09:45:19 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 08 Sep 2026 09:45:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788875118;
	 x=1788961518; bh=qn3F8gMKgd+rGr0Ix0q4yL6KpaV2b5CQQepTgShAvhg=; b=
	rsxXIoWWRytjxqlg2LGzdVXn4ANjSrGvW1y2Y7N4n0eQmtniYpQPdCpdUhmi+/GZ
	vyP1m8mZ4LxZhVH7D+qVI1diGRkj+c/zIhuVXbAOSiOWOSATGCh5n41qjpoekLdV
	H6iJDKdHSepNMxQUfBPL+neBnfqTF6At2R8HgwoiJp2Y7FZQ+4tS7HKnZL6oIr+N
	Ak+8wny0LLpJ/JTDcWpva72ZA8hpuf0sFhu6TCWsPY/J2OUCGMVD0AkksO/8Njkb
	4n/01epJNAAlAStmqsilIuYHnoDTuYuPo46LTx6iL2pvcVRIpoWF4UvPBD5IxJUv
	kYdkefWANCJqf8hatdL+8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788875118; x=
	1788961518; bh=qn3F8gMKgd+rGr0Ix0q4yL6KpaV2b5CQQepTgShAvhg=; b=C
	hwdEso1wtF35QlpLxi7rMXPofu22DQA1y+cYa4Dj86NQXnXp01KY58ZpAlnvygML
	GCCD2gsK2ziy7jSjBmOymJAQwjviDOVCY6I7cZB1OmsVqHO6sKc+BtaCrsvtWYFY
	xszHHZ8gOXvnOYVE03WDPdNyOYaErHOQOD4UjcPNKUonOn3c9sB9mZj0Ey5uKjz0
	OXF+TY25ID3yg5wClFm7I6JvZVy2TbZ7QrnJFdKOggxHze+3uLZcjespExZ+z7FN
	kIA0MYjzJa55TcnQcAI+eLMEoa52giZzFGvn8Fooa2ZDHG/BxuxwqzI6WdpkVW4e
	RzMfMjhMh/b766hm4pDLQ==
X-ME-Sender: <xms:bhGgauDFzlFsaZO73M5CxZw6UdM8YH0GkdFma6QdJlC1LYKIGWXDPg>
    <xme:bhGgao40YA-lq9fwd_uQXsYcxxG736FrlnkVw0OjDwf91NyGe3ayVAph1lLxJDrZf
    SDS_qrViRpxD6kYRhiDLKMy2tMG9Tl910Rk0UIjdBpiB71JDf8ri8g>
X-ME-Received: <xmr:bhGgaisC0BCgX9YfgfmEYgM-ywf_fEv_asQMaogWXhcS-NS-yZgccox9kex631PAKUrZQqRrmkTOSFe9eqZbPgx3>
X-ME-Proxy-Cause: dmFkZTESs8iH2O/nQIANZ43/73lk7ybnhxR88LDm4fuhwpy3OzZOZRUggTobnSAw7iJkns
    Uex91j3h6GTa0ZW8nD1eWGUtQYK3zkNmQh1gPNiZs6DJVJFX29P28v/UXxmGbjo6OYLYDD
    MrhP5DPtkcS0CYUD4w91djzYCU1+buuF44XbItOWNLEXADO9GIdbaBsfl+wh7+iEuuNiVX
    WYmRHPoSWQ1cVasc5lRdloKRDBOF69ieoEX7mt54YtGu6mobJu43GOKH2nNAG+n4XAPjI/
    AedWl/bHCHRnfSebqbox67SeNIEnlPfqmvrMyVEu8V8TRtdMEA6SjhS8x9tnj/xB/MI4rB
    bzXN/kHaRObdXwYmY/6a7Ipo8Xm1KZuMTma3NWu3A3elGybJB1MzELiIgUv89MqW4IYKy6
    XaDVh33RqL8vgif4YaN7SgyE+RGBj0tPuV9PnNdPmMm40E3GPYOcCbjItw9SJHhrXm+QJG
    Mw83tf90zNbVTBwgC8GH3UqdvBIxT4jQ/ddilvhWxdC7o0nLpw/iXNiK0qpl8Z7VCIZkK8
    B7inRx4K76cJwCgmQFvyne+oOQrqoZoDzMBDPxgyNrMgKi0d+YuMMTBO/rU2okObP0bwLf
    rkGAf+tEjnpGk0UKafQIJ0XX1un+HbJI7skSBYjLNQ91I8XXUr33eMcRMBZg
X-ME-Proxy: <xmx:bhGgaow_-fHoQfSADMbA3vBccbWT_5HZlQDmpfjc4hujWibNn9E50w>
    <xmx:bhGgaibbdo5jME5wf8IBp4pKbahd3fqGHOL_rgA3xiTdZLTbgvGNjg>
    <xmx:bhGgav4aQxcBZkiEkEr_xWaLX_h49rbk3-fTuJWqLtBTSyPyXciUbA>
    <xmx:bhGgap5PIJ6rVVEJKHtVlSALyWkVOdCvGJCc35AWwJKwB9EL20zr3w>
    <xmx:bhGgap4chohqsdq9wSKyl3QjpwJF2401eGkEttB8V8VdJlZnjA0t22Ot>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 09:45:13 -0400 (EDT)
Date: Tue, 08 Sep 2026 22:45:11 +0900 (JST)
Message-Id: <20260908.224511.1733725108685542391.tomo@flapping.org>
To: aliceryhl@google.com
Cc: tomo@flapping.org, a.hindborg@kernel.org, ojeda@kernel.org,
 acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v2] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <aqADhk2Z7ynuawJf@google.com>
References: <20260907123524.2332118-1-tomo@flapping.org>
	<aqADhk2Z7ynuawJf@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 8 Sep 2026 12:45:58 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Mon, Sep 07, 2026 at 09:35:24PM +0900, FUJITA Tomonori wrote:
>> diff --git a/rust/helpers/math.c b/rust/helpers/math.c
>> new file mode 100644
>> index 000000000000..e2ee29bcce0f
>> --- /dev/null
>> +++ b/rust/helpers/math.c
>> @@ -0,0 +1,8 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <linux/math64.h>
>> +
>> +__rust_helper u64 rust_helper_mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
>> +{
>> +	return mul_u64_add_u64_div_u64(a, b, c, d);
>> +}
> 
> This looks like it's never an inline function, so I don't think a helper
> is needed.

It's an inline function on x86; arch/x86/include/asm/div64.h.


>> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
>> index 6c0a5e8090d0..8e9c349b1df7 100644
>> --- a/rust/kernel/time.rs
>> +++ b/rust/kernel/time.rs
>> @@ -39,6 +39,10 @@
>>  /// The number of nanoseconds per second.
>>  pub const NSEC_PER_SEC: i64 = bindings::NSEC_PER_SEC as i64;
>>  
>> +/// The C side `MAX_JIFFY_OFFSET`, i.e. `((LONG_MAX >> 1) - 1)`. It is the upper
>> +/// bound the kernel uses for a jiffies span, not a wait-forever value.
>> +const MAX_JIFFY_OFFSET: isize = (isize::MAX >> 1) - 1;
> 
> Should this be:
> 
> const MAX_JIFFY_OFFSET: Jiffies = (isize::MAX >> 1) - 1;
> 
> The Jiffies type alias is always the same as isize, but it may be more
> clear for readers to use Jiffies for the constant.

Jiffies is crate::ffi::c_ulong, i.e. usize, not isize. And it will be
removed; replacing it with Delta<Jiffy> is what the series is for

https://lore.kernel.org/rust-for-linux/20260808062839.1159990-8-tomo@flapping.org/


>> +        // `bindings::HZ` cannot be used here. bindgen keeps the first definition of a
>> +        // macro and ignores a later `#undef`, so `HZ` resolves to `__USER_HZ`, i.e.
>> +        // 100, from `include/uapi/asm-generic/param.h` instead of `CONFIG_HZ`.
>> +        const HZ: u64 = bindings::CONFIG_HZ as u64;
> 
> Sounds very error-prone. Consider fixing this in rust/bindings/lib.rs
> similar to `compat_ptr_ioctl` and then use bindings::HZ here. This will
> reduce the chance of others using bindings::HZ and getting the wrong
> value.

Good idea, thanks. I'll do that in v3: patch 1 fixes bindings::HZ in lib.rs,
and this patch then uses it.

