Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783286;
	b=J+co5JKxS/p5eERD0OYKc7OFHbO+0pmi2uLI/pbHFnyjxuIx0h1cceqrGcEVNh5x3huW
	 oVVCSCLKyW3n0nXfuo3Vqivt1S6CokaqsFHkfD2xV1SR3MsXNVKPr/vGX2DPNVt7i8ZJn
	 Jp7zzhzI+TkyMc0j32QkhuLLmqDDXtTabK/6C1vMVUNxyL58a4bPsbjoC6azL2h2mfENn
	 iLu+WTTIgxqomr3zk1ltTAgQZraVwf2axn2RIO47t0dqHCYts7WBRxVb+zgLZw15v/Il3
	 e3zbRJzSwMfv2v6jS0cQw+XQzcXSNMJUUW1/W3HulBQ9qxUzz136irw5Zc8Rw622NNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783286;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:From:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Language:
	 Content-Type:Content-Transfer-Encoding;
	bh=n6sjtzia/9qVvozEkPywWapR6k1Ealc6KRJ9DwbhjUM=;
	b=bf5Xftq94KjLIha5DuHDWPDEcfqsVF4j5CwgzefYXG5YKIXasqnWfiAJvTgyXp3k0S7q
	 N62yB45F7xi1XIL1eaG0hVcOTvl7gQbvo1uW837B6PqIetzOr7ELl7g/EnF6LXUTkj7iM
	 XEBqz1xHrM1RxEKPxGxZhAZBm/em+tx6XGvDm3nx0JPnJOJadaNCeR2shayQLYqDlrWoI
	 Mzya2jXWUOi6Dj1eMvAtjXtiGmZ1/0jPSNy4H0lQ6W2uKLHTJXWJOzeGpCYvI0sY57jcr
	 WXvJOmmr/4ZkTOKEqLdLCs15AIs95gjbsxVWolW/bE+zz28OA5pvPWJoatLJl0NQF3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="e6BVF/6F";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DCB60A2631
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Nov 2026 12:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29DCB60A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e6BVF/6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795783284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n6sjtzia/9qVvozEkPywWapR6k1Ealc6KRJ9DwbhjUM=;
	b=e6BVF/6FRS7cwwGoEgOSJmveFKtArBFTPa8gU2ARGvFsZTzlQYcYr2zQnpksJ87VhvTv24
	bGdGxQt8Ga17ycO3HtiOqhdmx8TCx0vy+C+fiBjIg8a/VMS5Q9/sb7VR+9PyLjc32zAbqL
	1ze+kzN5HCg/MPnv0Y3xqs9FsZd4A34=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-Wtq1D4JtPc6CDyYMSYgbAw-1; Fri, 27 Nov 2026 12:41:22 +0000
X-MC-Unique: Wtq1D4JtPc6CDyYMSYgbAw-1
X-Mimecast-MFC-AGG-ID: Wtq1D4JtPc6CDyYMSYgbAw_1795783281
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-49d70f45b22so4763077f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Nov 2026 04:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783281; x=1796388081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6sjtzia/9qVvozEkPywWapR6k1Ealc6KRJ9DwbhjUM=;
        b=G324ZCw8lxtix9GiNntestNNXqb+tTuxP/4FPYgWQYnGW9gKGruH8qDcPAC5z83QOz
         5sQiYZoH447WLLAHxAWemMQGIOIPEnnBCWQNOSfotlwaF+RDs0smMzOMeJ+IGBaB6Leq
         FXt/1TblFcoVS+pa5jVlrIWA8YBK6vnBHtmwhCVR6pVjodrmRYAgoNgrXTqLb+fjhoOn
         2zVxJT8s4cekHt7ukSTIf86oaHvkx1/94mtkIOPUuSVlMl4j1jtanB9mo1Zy2uaLLLHR
         lKXaGoJPog/vQhIrjXXPx5wojw5KVRZO0N9BOKCgRctNMyQ5vf2OYki8Ve6aBB2n1t86
         JU6A==
X-Forwarded-Encrypted: i=1; AL+hErGKrZwpUYEE9WWVvZLM/EUiyVR/2fmFUulJyI45V3HzaSPfbYjlRkwnI8T1q4sii6FtyFpHeeituEOy4WlhnQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/nDMf6NwITVRz2TtCiwQ2tDaftuOPR9ORfDHTEgi/X36Kf1Xjp
	VnstPQAfgBwGtuTJ4ByAprkG2zl8aO9EaJFCB/Sz5uDI/GcKPCW1Zf8vFMVdDWD7amq4tV6wU4C
	zHvBBeTqPzdSLyigkYHZJN91upxmYK6V2YSexS7o1LvhdBUlmxFg5jCId2srzShwFLIPN
X-Gm-Gg: AZFdTZel31v8Q3yGUVzGaqIyPIF3+XCK2dvzviBymG9gz9r2omaNKZrkgV2fqp6w7GN
	g8fFOLeqPl20xM6k+s01G8g94zrvjFsmNN+L3nXNquHYKIBVC5Ts1COoQkp2yjfoE+AdL8iUgB6
	h6bjnQ2b8uffNI8+BEBKqJtETQemrMSfhH7OQEExGDvsUqNGB6nkUbg0SmByJaBMXi0s5sciIVJ
	i98RaUURETIfOsmpHsVLm8MXlBix1LST3H8gVtrByQNLmYWOjkeqNFr74eSsTW11EBoGFzwRHb9
	yzVnxP7+bbVp/5EWKxFS7BAo41VO+TsRT8FACSK5Dy0X47jVo7OGD1uezPjahkjGYmoQTuhxPSK
	S6wu3ZbcO1QMT8TO1T6ZgcYyrlCeUh7f844dhTJgr4OpLO5nnxqz175hyQZSHvQW/MZWlcX3ls2
	uy27sHvOMP5IUqVuJ6gGtv
X-Received: by 2002:a05:6000:2607:b0:48f:bb92:c5a7 with SMTP id ffacd0b85a97d-4abb0c5d665mr48588270f8f.9.1795783281257;
        Fri, 27 Nov 2026 04:41:21 -0800 (PST)
X-Received: by 2002:a05:6000:2607:b0:48f:bb92:c5a7 with SMTP id ffacd0b85a97d-4abb0c5d665mr48588225f8f.9.1795783280861;
        Fri, 27 Nov 2026 04:41:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9? ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm53695095f8f.55.2026.11.27.04.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:41:20 -0800 (PST)
Message-ID: <ba9b59dc-1e4e-4a59-8354-e4ec0de4ef1d@redhat.com>
Date: Fri, 27 Nov 2026 13:41:16 +0100
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
Subject: Re: [PATCH 1/3] drm/panic: Check QR alignment centers one axis at a
 time
To: peder.bergan@gmail.com, Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261126-perf-drm-panic-qr-v1-0-51856937dc4d@gmail.com>
 <20261126-perf-drm-panic-qr-v1-1-51856937dc4d@gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20261126-perf-drm-panic-qr-v1-1-51856937dc4d@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wgl65a-tX39JIom8TlsUUf8KqHaxKPUVq4Dqsr5vShw_1795783281
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 17:53, Peder Bergan via B4 Relay wrote:
> From: Peder Bergan <peder.bergan@gmail.com>
> 
> is_alignment() scans pairs of alignment centers each time it tests
> whether a module is reserved. At version 40 there are seven centers
> per axis, so a lookup can visit 49 pairs.
> 
> Each center covers a five-module span, and adjacent centers are at
> least 12 modules apart. Find the unique matching center on each axis
> and apply the existing finder-pattern exclusion to that pair. The
> lookup now needs at most 14 center tests.

Thanks for your contribution.
This code is executed only once when a panic occurs, so optimizations 
are clearly not a priority.
But this series looks good, and keeps the code simple.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
> ---
>   drivers/gpu/drm/drm_panic_helper_qr.rs | 19 ++++++++-----------
>   1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_helper_qr.rs b/drivers/gpu/drm/drm_panic_helper_qr.rs
> index 4941731fb60fa..c6ed395c05bd2 100644
> --- a/drivers/gpu/drm/drm_panic_helper_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_helper_qr.rs
> @@ -746,17 +746,14 @@ fn draw_alignments(&mut self) {
>   
>       fn is_alignment(&self, x: u8, y: u8) -> bool {
>           let positions = self.version.alignment_pattern();
> -        for &ax in positions.iter() {
> -            for &ay in positions.iter() {
> -                if self.is_finder(ax, ay) {
> -                    continue;
> -                }
> -                if x >= ax - 2 && x <= ax + 2 && y >= ay - 2 && y <= ay + 2 {
> -                    return true;
> -                }
> -            }
> -        }
> -        false
> +        // Centers are at least 12 modules apart, so their five-module spans are disjoint.
> +        let Some(&ax) = positions.iter().find(|&&center| x.abs_diff(center) <= 2) else {
> +            return false;
> +        };
> +        let Some(&ay) = positions.iter().find(|&&center| y.abs_diff(center) <= 2) else {
> +            return false;
> +        };
> +        !self.is_finder(ax, ay)
>       }
>   
>       // Timing pattern: 2 dotted line between the finder patterns.
> 

