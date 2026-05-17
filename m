Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8E32F7EF6
	for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 08:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779005389; cv=none; b=Ng0NcIAoSBphszg0lwMeJJFgk/N2hOO2S9pUOPdkd0ggvEZNbEfAHDekhsnyAzQWWm1jm2dvN7ZdutrcaVQ+q3c2N10OTvNMzD7JOvHtKxTvGO1fKiYIxo9Tn+UEamN8kVD9grqC7yz+IrRP6XF7qcBzjtciwMOWqbIqa5Ggsx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779005389; c=relaxed/simple;
	bh=kbwBJp1YaFiYMYBQ5HwtsOteGWjAla/XSzKeMhwGk5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tVCKMLVNsmxXEM7lcnUesEkwsFXAEfcJaDcverj8PBoCfwKQPtAhubEFZhlUwiVpZieiiNFnMrl6ojUOtllnVQLlDAjlK+ryMgQ5jGOW30Jwc/+rNGO+Zsx1cxou9Au6iGCsWY/6BFImWG13WQ8X5EeAbH1mg9/vURga+rLzbsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXNv6QfN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXNv6QfN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso14849555e9.0
        for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 01:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779005385; x=1779610185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QI5AguO9/rJalyHGNSvMkm5DR7zkmggq523vj4QHofA=;
        b=cXNv6QfNNKhCJ/GaC162/O/R/3rHvwJf1EI2oOAGvBamjyPtbFBN0S7+MS5F68gihU
         31skrCVj5uU1F0YlhEOvpYLfPmQGUauj2L/VTeZlXd7a7gR23UV84bTrANwhB76orSV4
         j/ViflO3SVA+PT6knPyaCuQIqNbWOeQXs2fXccNaTrlwHBgyFGbmyjPPuC8MjwgftILG
         TjhkkUOouqhP+brRA4TKQ38Pr+pFoc8Hv/GnzZ/sQB0PYa0J/hYATi29rS3OAfbqNBHO
         ojbqL8aAknzTq8y2lIqypy0Yc6e8a4p6e3/e1n0wPzTloCVGGKsnwf+qXEwqtteueOrL
         7o1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779005385; x=1779610185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QI5AguO9/rJalyHGNSvMkm5DR7zkmggq523vj4QHofA=;
        b=IJPcs5WaxUUcR5tmAXJdnhtI4ZVDpXhLGV0no7ccn6lmp0vXxExS/TQFbUanA6iONT
         BFieQ4U0afHsZSsMGqJEDfavJcACmxgSn9CXM8fVRfYyzCjrCG7rqNXPBqbwMkD/KEJW
         YP9zDe4lDeNLKp1w9OC61qMOzNU8GHFbAyrcRO1WIzEpV34AQkSSyLkOatOZrh3hYRAT
         l3bwxiPNKTAs5F2yS22Prga43nLUoWU+AplgOuZ5/Qw3cUgTSfHbskMhrWnspbabS9+M
         zvJsp5frSIy2bZ+sbQ2TVJDtNIShNxl6BCdWSk8XUHpNAG9eCN+PmSpbpXtMwBoTS8ZX
         inUw==
X-Forwarded-Encrypted: i=1; AFNElJ+e1UAE6jBfXYoGTtEPF44/ftjXb7l8pKejxY98gPEPWY9GfHu9zdNtAqXMj9uqU94zZ2N0nWH2RrqWB9udyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo/dDgUWpHkI473MjwWxwg7l9i+F8vjBYK3xRRTanLk0nKwu+Z
	/6YM0Xg95L9Ce/gB/70XATYrSBpa4Yp8rpynZ75BbkdcdaExWD55H47V
X-Gm-Gg: Acq92OG/OSqf6PE9boGKSTqfB3XeJ809G9Jx8glARq5+59PZWbs2O/kJqUpK5e42HPA
	OxlBCgew42aCvPTWWChvvkUIYRRoEj3auoxVInfb7v8U3+esZ+mOYI5T5NTCTG1kA+FMckR6q57
	30WrreUvs4JPyPajrYXrOoOSSeCbXzGk6JLk9u/BRlf0m6IG1EQ5KC+fS9b6eNczt1gbOW1thYs
	n+rZTrMIp/P0Fpau4R5/PX8EZ2GYGukwRZBzzPAmUaJLtQCDVsxRnVCE2eX6ZLEi5JuP3EWoViQ
	NO+2Z9EVtF425Kg4JxdwF9W5CMm2dapUyLzEmuK0CAAaMTTLdJWxF4DVcLySF5A+2dwjkQVG7iX
	7UxP6waH5MHpbS5BvrEcPji+7Z2n5GuYUYhZg3dT6QfZ0/qva268ee85r1iPd0fH8rsFxwmsB2+
	cP2qBDHHf/SK6rgmT1gxBkmpqdErue5mzVo91UdlUH2O4KCeBq/Rb70TIMeFBFYrA2499lX+804
	hxiZYjJVW14x7+tYBMASB6HOk3TNbsXOJTn62O75jGazj1lcRdNHk4T2g==
X-Received: by 2002:a05:600c:4455:b0:48e:8dec:19ad with SMTP id 5b1f17b1804b1-48fe60ea94emr143018005e9.12.1779005384814;
        Sun, 17 May 2026 01:09:44 -0700 (PDT)
Received: from ?IPV6:2003:df:bf18:1100:dd94:6a85:70a7:b48d? (p200300dfbf181100dd946a8570a7b48d.dip0.t-ipconnect.de. [2003:df:bf18:1100:dd94:6a85:70a7:b48d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0f72sm30335649f8f.25.2026.05.17.01.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 01:09:44 -0700 (PDT)
Message-ID: <23e1bcba-da88-4cc6-83ca-b77bcdaa9d2c@gmail.com>
Date: Sun, 17 May 2026 10:09:42 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/18] lib: rspdm: Support SPDM challenge
To: alistair23@gmail.com, alistair@alistair23.me,
 linux-kernel@vger.kernel.org, lukas@wunner.de, Jonathan.Cameron@huawei.com,
 bhelgaas@google.com, rust-for-linux@vger.kernel.org,
 akpm@linux-foundation.org, linux-cxl@vger.kernel.org, djbw@kernel.org,
 linux-pci@vger.kernel.org
Cc: alex.gaynor@gmail.com, wilfred.mallawa@wdc.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, aliceryhl@google.com,
 boqun.feng@gmail.com, a.hindborg@kernel.org, tmgross@umich.edu,
 ojeda@kernel.org
References: <20260508031710.514574-1-alistair.francis@wdc.com>
 <20260508031710.514574-19-alistair.francis@wdc.com>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20260508031710.514574-19-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.05.26 05:17, alistair23@gmail.com wrote:
> From: Alistair Francis <alistair@alistair23.me>
> 
> Support the CHALLENGE SPDM command.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
...
> +impl Validate<&mut Unvalidated<KVec<u8>>> for &mut ChallengeRsp {
> +    type Err = Error;
> +
> +    fn validate(unvalidated: &mut Unvalidated<KVec<u8>>) -> Result<Self, Self::Err> {
> +        let raw = unvalidated.raw_mut();
> +        if raw.len() < mem::size_of::<ChallengeRsp>() {
> +            return Err(EINVAL);
> +        }
> +
> +        let ptr = raw.as_mut_ptr();
> +        // CAST: `ChallengeRsp` only contains integers and has `repr(C)`.
> +        let ptr = ptr.cast::<ChallengeRsp>();
> +        // SAFETY: `ptr` came from a reference and the cast above is valid.
> +        let rsp: &mut ChallengeRsp = unsafe { &mut *ptr };
> +
> +        Ok(rsp)
> +    }
> +}

Just as reference, there is some discussion about this in

https://lore.kernel.org/rust-for-linux/2026051610-flint-compound-810f@gregkh/

Dirk
