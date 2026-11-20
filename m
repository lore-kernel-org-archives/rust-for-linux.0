Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190769;
	b=edP66guGFNfehSFa+reMC3e9cDD4/WGS4MYMXwf/INZp4Zi+nTqi86Ps1egLRmsnVizp
	 snyUz0Ry601hk1VXAB8SXWg6nJ5fdquT+PgIuQ4iuCqH6UTqSlKb8AIliQajmM11F52Gf
	 tPpMQc7Vw3DQ4AUXZrK2s27YPxrK5JiTWvjVPIqiyQ/6hv4QakwH9acU2Qa47CpLM/5CX
	 Odue3545HdQlMJLoOyDgEpEtLWpM7SBl/tGckhEvNJbPpDay9FFnmiiA7yugxBP3FOgLH
	 xLAX247zGYYsBXzzK8XFaklu7+fBruOkQswi3jH7CNq8vP4s+7D/pvfkzIphOW4Jm9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190769;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=cB+xUv7w1KY1jdh5E4wnq+1DubRDKcjagVPfCrGkLyM=;
	b=MH2MSq3xIbcTkUAkKenUG+7vB+GBt+5xRJ8WHf2uIcUZNRZPRf1t1gSWO3O6/yL5Eot2
	 YKRlNKHNr8GXeIZ4TmZym0JNBiH0CScYs/CxUaiRNjfSkuEZRb0NCRAZYFibYuPR9o/w/
	 GGky6nB6WFKJnIACdTD5rK7oWO6FDwHeFoCPvlHp1eV8oma+Rf3GZM0a2JJEsHvcyfrBn
	 KLgCOXanlotV9sJQDv+BgDT4ilB+W/TppDjBJf4odlHMtm1qOczFRbLwQGaxKQI7dHmdc
	 TG5NuhxqeYxTq1a8WUbIxPMpVCc1qxomEs4BWAo8eruw/jxx5uqtAoAbbW6vEaCfIMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=WfD2bv34;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B288606A320
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 16:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B288606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=WfD2bv34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=cB+xUv7w1KY1jdh5E4wnq+1DubRDKcjagVPfCrGkLyM=; t=1795190768; x=2110550768; 
	b=WfD2bv3454Ia89k1TmXSCxms7lnG0j6n2mSowkbFziIQ2ygqKSG4LXQ9ZkqK3G6omplPrFKe7qN
	u3jZssiHtdrBoe8IhvGoLivFkLiEs2I1XB4/Hq5VzptDp84CcxOrWV2Y2i/K43/uKNmS1p4i49P3h
	56mYhtYT/rd9k3hii572In1FPVZ+SilIO4+b6dd9oQkImJQuernxH1ljjWYb4XXXz/rZZ52rK6WaB
	mTWEnnjFYc4wYJBABsVsMPMhdzsH8IA0Ko4wSxh03MZzszsrqO/2uQoR3Dm6LfSINU8zerPLKvIni
	ShZonWPv1UzNFCOfbl1tX/ZZfFtmdmzO906w==;
Received: from [179.105.94.163] (helo=[192.168.0.4])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xUR7e-00000001w50-2e5Q;
	Fri, 20 Nov 2026 17:05:58 +0100
Message-ID: <d2aa7dd9-367a-4b6f-8dee-3913b8e5f6a2@igalia.com>
Date: Fri, 20 Nov 2026 13:05:50 -0300
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] drm/panfrost,panthor: Refuse to export WB_MMAP BOs
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Akash Goel <akash.goel@arm.com>,
 Karunika Choo <karunika.choo@arm.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>,
 Chris Diamand <chris.diamand@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20261119-pan-drop-dma-buf-hooks-v1-0-6c6f1629e7f9@igalia.com>
 <20261120105654.63e1c254@fedora1.home>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20261120105654.63e1c254@fedora1.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Boris,

On 20/11/26 06:56, Boris Brezillon wrote:
>>
>> Still, if you think this would be problematic, I can drop patches 3 and 6.
> 
> I was about to suggest forcing uncached CPU mappings for shareable BOs
> on systems where the GPU is IO coherent, but there's actually no way we
> can know whether a BO will be exported on not on Panfrost (on Panthor
> we at least have this exclusive_vm thing that gives this guarantee). So
> there's actually no way around it, it's either going back to a "broken"
> state (broken in the sense it's not doing what it's supposed to, but no
> one really complained in the past) or keep this sync logic to try to do
> our best (even if it's not entirely safe, especially if the importer
> does crazy stuff like pretending to be UMA when it's not).
> 
> Sorry for not having a better answer than: it might be okay, but it
> looks wrong. Every time I tried to understand what's expected from us
> for this shared buffer synchronization, I ended up more confused than
> before...
> 

That makes two of us :)

I'm okay dropping patches 3 and 6. I decided to send them as suggested
in our last discussion, but when I analyzed the IO-coherent case, I also
had the impression that this could be a step back.

V3D doesn't have the IO coherent case, so I can move forward with only
Faith's drm_gem_shmem_sync() helper and I won't need the custom
dma_buf_ops.

If possible, could you take a look at patches 1-2 and 4-5? I'd
appreciate it.

>>
>> The Panthor changes were tested on hardware, but Panfrost changes were
>> only compile-tested.
> 
> Could you prepare a custom gfx-ci kernel [1] so we can check that mesa
> CI is not regressed by this change? I know none of the tests in mesa CI
> would normally hit the removed logic, but better safe than sorry.

Sure, I'll test the series on Mesa CI (without patches 3 and 6).

Best regards,
- Maíra

