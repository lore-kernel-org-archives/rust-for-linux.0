Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4093D331D
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Apr 2026 13:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742698; cv=none; b=HP4Y7R8KLioyFz3NX7uSAMluT/kN7tfN4325zGa9sKiE/ZLEsvTZgk31tjbyBpobqd//PiYDCB+pmDHs/ptJOng+vL4K2JD3rQNVoUGh8eMj2lEmdnBXAd7It0keQ3KDFcLjjlJnNRjIiMocWyZEzQvjEo5pTbGAo9kEXLNys2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742698; c=relaxed/simple;
	bh=mXswLbpZ9JdNrB/0wHEoAET14UB/DAIGJpdHVt4myYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n0flg5AmbF9o9KiAT2xPbbTXQZhNoNuI+vrvy4bOt4e2OTnUrB3usixdaKiZ7CTL3Qs+2/teirbF8bVxctM1J/f8oKuTNptY6xRIAfI7EUvRmI21Tn6JHs3+fDeOzwfh/abGFCUhKo39TEpRw8DZVzO7iYFBp3OWTapnHfoxCsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYoezael; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYoezael"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b24fdac394so8856865ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Apr 2026 06:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775742696; x=1776347496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tue4I7fN80NEM0l+iK4jKzlt1Vf/f8zpQJWvkc7j1KM=;
        b=nYoezaelYRw0OC+aeN0NsrnWWatRj24pffSMA5C4eziEmJTj8su1NGRhYrJ+9XCPJ4
         0fp0ENT2RdhjU6QGeWvPt4Lr9GkLEH7QGoKVyk+htwQD46w+jwH5kD/i/ki2DocgNxo4
         5ia1Ko56Y/XZ1Pw3pAmU35Uv6hu2wg3vusShhQEntBlE9spCHaQuaffZ2R3riSc+01ot
         fIxE6TSneYb3PkciuCJfIUKdbZuMqPvCw7mw6Fx5c4B0Ys5VHlXLZ9lv+dRVYMmvQLZc
         aIcWtm2alh8OVQPJYIBTmlJSTOcWu9d6CICJFa/dQk+EAF98GUXswIAGzWZdXN5s4FbR
         GUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775742696; x=1776347496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tue4I7fN80NEM0l+iK4jKzlt1Vf/f8zpQJWvkc7j1KM=;
        b=kXJlPD+ugylal6woOu3RFHDkvEH25eB5Mv5jm4c2GevNsrroMeKDB/RoNbnFa8pya/
         vrR09bRKrT+oQHzWCMuv85rKi9HAWCV3rwdujvasbUavu+O76HxDYAdZMsntnW9j3M4L
         PWtBqKdeKQ8THcl7QO/MgTBWJM6Wn0bSqRYOg2z9JBPMFxqeuvZgBKEw8MO9hzJrmBhz
         Ck+hkrUfb1w94JxfGLG+Yk6LKmDPwlIAggIKG1h00ILregVPPnzvAG8DLLr38o8wUbH7
         OXgNe8UKF1C7ufjg+Cifhsl3rRwYTa1xpw7MiZ7AN9x0FlEDRQ5n33004tYjfemP6Fby
         mweg==
X-Forwarded-Encrypted: i=1; AJvYcCUwYsRwkGsXQFfJCIhc75NJoBnUOsM9KXg3i2EKqbnJShxbj1lfPVQCnDuNf+Ym6wLu7XNOQXjf9bedHYmZRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlo6UZmmXv/JRZJaAezqR4oAySGVn7mx8M0PJcld7Ikau9Baxf
	ya87CcUgNLlOT1ru/04bNqWD53jo6PRPM3ZGJcNOTh/tQlYwppNZtxjN
X-Gm-Gg: AeBDieuRPPTHYjOnq/KGtsaaramt3dR047e3G/vZlKhr4lBiB1MrqKLxPYfcY1ao9TF
	wNAG/CC6I4S7vopwxhcccSO1Ff0YI+rQzB8RFieRzRs6CcGayeHhpDy7sy3EUwnEHXLYtJeMRpS
	QNQRIceldvIPtzOvcEOALhA9RiP7teq2osGRybpwunQTU/M4Z6diMu2RptjLLzUYmFQ2ZDSlyGa
	v7Aj4bMVSISy16tH0oWCHoD0vyKaPC/RpG0WLIY8Y2R2YUEANkIK4p8STZJAd3rUDcZtnjLg/Jq
	nc+7cMuPQX5KjY5GLxGSeEoU/Q6nsEoIB0AFMmVbpm7FHFukWjkBFlrNoXW+tu2od98uw6PIz+Y
	B/GMxTC0OMcNOgIGELUBwx5P8P59uI6rCgVuk0Yizw0GbgbEcKM9+IHLT6Y2OmsHHCIB6n6OSBc
	9W7oQ7As7K3cVEeaa9MQ9uxRln9aiLQCvjmE3srUrY8Na/qUGBZBcegJHls1xjnPub
X-Received: by 2002:a17:903:a86:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2b2817995b8mr254896395ad.23.1775742696279;
        Thu, 09 Apr 2026 06:51:36 -0700 (PDT)
Received: from ?IPV6:240e:38b:d99:bc00:6f49:80a8:c181:297d? ([240e:38b:d99:bc00:6f49:80a8:c181:297d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27475ff56sm236508365ad.22.2026.04.09.06.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 06:51:35 -0700 (PDT)
Message-ID: <909032ed-a67e-42e2-8f34-b5bc5472b1a4@gmail.com>
Date: Thu, 9 Apr 2026 21:51:27 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] docs/zh_CN: update rust/quick-start.rst translation
To: Gary Guo <gary@garyguo.net>, Dongliang Mu <dzm91@hust.edu.cn>,
 Ben Guo <ben.guo@openatom.club>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <cover.1775619061.git.ben.guo@openatom.club>
 <b5e1246269848fc95d118a722fb11eee88961053.1775619061.git.ben.guo@openatom.club>
 <DHNQOSMQJV1A.18UJB6VG0QK70@garyguo.net>
 <46eb585f-4983-4821-9be8-ef57571c3516@openatom.club>
 <DHNYKCR34P1F.1EZ3D0A8UB8S5@garyguo.net>
 <d7e81015-f17e-4ab9-a9e5-d2ac6dd82e7b@hust.edu.cn>
 <DHOJEMI0WBYX.2Y6HFZ2PYD7HS@garyguo.net>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <DHOJEMI0WBYX.2Y6HFZ2PYD7HS@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/4/9 18:03, Gary Guo wrote:
>> Hi Gary,
>>
>> Let’s wait for the rust-next changes to land upstream first, then I’ll
>> ask Ben Guo to sync that commit. Otherwise, the Chinese translation
>> would do not match the original English doc, which will confuse readers.
>>
>> We have checktransupdate.py in place for monitoring the updates in
>> English documents.
>>
>> Dongliang Mu
> Given that you have tools to catch this, I'm also okay with this patch landing
> as is, with a follow up translation when the new quick-start.rst lands upstream.
> 
It's better to have the full translation after the formal English 
documents merging into upstream instead of several parts to combine for 
a whole document.

Thanks
Alex
