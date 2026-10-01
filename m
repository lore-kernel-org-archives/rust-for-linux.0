Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B021D4C224A
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 13:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862062; cv=none; b=YXILn5E47XV70iz2PrZSDMq890ZiZr8hjAvNC17fGhxsfryKFMjShf0uVm9rIcg/xf8Bb9rIm8+8hZkjr9402YpzUqDjtnHDWbR0JwMSsOhbo4jAp9Jl/3HOYYy5EIwwKBnNX1utXO+qE5bO/eAqYNmZMYMpZ7mn+5Npv+bMxxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862062; c=relaxed/simple;
	bh=jSF6sckf2CdykpIyTHyIXc502TuC2NL74BfAZtOKhK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0gACU/X/YHuR/Ei7ALZkaxYxSwGZdPIVq01Cpegz1V81pzhEUHeq3Yh1xpjJVcq0MyUJ/Of8rzRy3+UipPgYMnV6fWgD7JCwG1OQ6UU+9Jdv2iqddj/09epCOnJY5KBgAvEj1prZ+AiYAGmuDWie+E43F6AlVwdVeUqUI2fbHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=exp965j+; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="exp965j+"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c41135so1284719f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Oct 2026 06:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790862057; x=1791466857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGqLF1Rm/hEU75zgoHWcWsfF1Mh1p1AKwwc942QTcEk=;
        b=exp965j+dK9d3Gg6mjmXjj64N8SdLOy+ZO3GDm6KuE6rw9tKEECr6wmASJdpi7W+A/
         X1vof8aRgStYFZTE9Dnqt+0uSPx7g655K+vzr0LvkZF5qV67VZnkXVnnaYARmlEj75nX
         ljbntdkA8J3v/FpBR2KA1vB9xIisyPDceWiKFoNsmV7ugiEyRoKO9BazcrAMJaGIUPNu
         Y4XAR4SHh9QDwqol+bU2O030hn2Qk44gRWDi9lXA1T9cehmU8Pprdh1OOV2zb0YPUP4S
         HNUHFt/SgkuRX7/no6zQ+uvTatXpJ1rDOWX1+CDt24vc4a6p8pm/i+PlatQSEKTKPZlD
         d9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862057; x=1791466857;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGqLF1Rm/hEU75zgoHWcWsfF1Mh1p1AKwwc942QTcEk=;
        b=r1Tf7D3z0EEMvTCU6sdQ1VgvHdEE3eDEmrWU8w4q+/nvAhdjD7K3InmCCPPlcDVUob
         OJrJ8nmBo6qQ1WASektNqH+ufc8cDa+rM3eyxN96I7F36yy6uz4GwZwwEDvrldkAW1AU
         AlhCS7LY9xtgHvLmW1waLjcS1bHSMWWilixwkNRwdTMm9/rOjHMTmNkTl+D7/TnXvQsI
         S8IkqEIQeT4b5uHn9dAdywXo2TxWk5qkc8enjbmjJp+jNxCf1K77hjwfYZs4Z5MVsWwr
         TJn2EM5v+mdlBD2JgaEU9XV209c3uuL03+6Cr8prow9Fo489bCON7LkRyBHJMYNmGGMm
         UIwg==
X-Forwarded-Encrypted: i=1; AKwUvBxG05NiNePI9Ogf/VzNFBwGbXNB/egxYvVvxfM+2GKgIlN37EhQ6RpBsSb93wj7E+2uW9EXe5bcPiRT9kdA1A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKUqIOmPcKbqx3XTvY5oENdRTv5BFzFxl8fWQei982CZfsJDWIx
	YnQ0s+C5sjVfgNOfiCJgmyL6eSM39+4XDvDDs5P+ZpOmFJ5Pd9yopcVsvBcXKMxYFnU=
X-Gm-Gg: AYBFou0/rD9ceaHJe+Bq0P3vo0k4YqAzAyAT4bNR7LrG8B74aruPUdacq72EnFchPtv
	JAtRwxsFM0Rre+aq95jfMOIUQng+fAMkkTCpaULZDRN/3rfmPryNCJvEVa584e4Iq+dqB1MV9C3
	bcGFz3tLPOS8Oow4ecz4NYumt3idKXdKxErpFoIkM4gtBLxqho47s/q2pMiFFExYGOU/7oOzCQ7
	DHbm6m8Br24Yo/sKjwjz/dRc+O1/AITbNwkA22C906Um5QOEQ0IekW6nC0bF5OqQCMk+RyU5F+G
	szxQQnqs1DO5vGG+LfWPv22bQVNDEvWeHQh7BFef6QdnLYYlurSAfmZflJENfkuToLKVlJS1MYq
	pKPGxii5HccpUmTpQG3dpeA9RGszUNBji7b5uK12NDpX++FdpfwIecRYRa+IOwHc1HPqCPsN2Tj
	sehzmW1UJyF4LAbn/d28EwplYtXhYg8yNxQwVOGDyerzWVU25HryoJs1i19N3Vdb8f5aQr2q32R
	xQvHnYLXAUp4CwPKE1QYLS7L3YXlXt0+WE=
X-Received: by 2002:a05:6000:3101:b0:48a:f318:ac03 with SMTP id ffacd0b85a97d-48b02505291mr8094664f8f.25.1790862057220;
        Thu, 01 Oct 2026 06:40:57 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691d681sm5667084f8f.23.2026.10.01.06.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:40:56 -0700 (PDT)
Message-ID: <2ce83a44-c85f-4e3d-ba47-fa07a1663253@suse.com>
Date: Thu, 1 Oct 2026 15:40:56 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: macros: allow non-ASCII characters in `authors`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260917051147.98775-1-tweek@google.com>
 <CANiq72nRLF7PmqqVUrAiw_M3dYZCr9ifoo+Q4SuXfBQsAFH-pQ@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CANiq72nRLF7PmqqVUrAiw_M3dYZCr9ifoo+Q4SuXfBQsAFH-pQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/30/26 2:13 PM, Miguel Ojeda wrote:
> On Thu, Sep 17, 2026 at 7:11 AM Thiébaud Weksteen <tweek@google.com> wrote:
>>
>> Module authors may have non-ASCII characters in their names. In C,
>> `MODULE_AUTHOR` allows arbitrary string literals which are emitted as
>> raw UTF-8 bytes into the `.modinfo` section, and multiple in-tree
>> modules use non-ASCII author names.
>>
>> Originally, the single `author` field permitted arbitrary string literals
>> including non-ASCII characters. When support for multiple authors was
>> introduced in commit 38559da6afb2 ("rust: module: introduce `authors`
>> key"), it reused the `expect_string_array` helper that had originally been
>> added for module aliases. Because that helper enforced an ASCII check,
>> `authors` inadvertently became restricted to ASCII-only string literals.
>> Later, when the macro parsing was rewritten to use `syn` in commit
>> c578ad703ae9 ("rust: macros: use `syn` to parse `module!` macro"), this
>> restriction was carried over by using AsciiLitStr in `authors` type.
>>
>> Change the element type of `authors` in `ModuleInfo` from `AsciiLitStr`
>> to `LitStr` so that UTF-8 author names are permitted.
>>
>> Fixes: 38559da6afb2 ("rust: module: introduce `authors` key")
>> Signed-off-by: Thiébaud Weksteen <tweek@google.com>
> 
> This looks good, thanks! We did discuss allowing non-ASCII long ago,
> so this wasn't intentional.
> 
> Petr & modules: I can pick this on up (an Acked-by would be nice!),
> unless you want to pick it.

Acked-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
