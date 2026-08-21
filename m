Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3684230F927
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 05:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787289952; cv=none; b=tuzWFZ8Mc7uC4twXDb4JPasiLSgY5/eMjNYnSvVT29rW+PAfCqaPXxehBF3Lqsu99hVpP7Z1051hDb/5+HI7d0Q5QkIYV7hKXwhT3Ku8tsMjr9DM3tO5PId9ILvsMC2Dtf95j6YxKQJTXe+a1n/RI3h3Afl3n/mX70qm81HAb/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787289952; c=relaxed/simple;
	bh=B+4n+MJXTXrb4ce62EyeAqbun4UtjYSKdWJfVRNW0b0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hV94GH26WwUivwZuOb+0UJ+N2eTr/Mhb1Enl4Iq38AEBrSu/ZsM0BJgNoLMimiRWf/m1LTcZ2I4nYyu8fz7gXbPUhH1oQVu6DIXzd3/A4k82pH0L9F4AB5YqEoV775Li9CKNuJbCDpbiFVV6UnSEXZFWt3OV3uZTj1VNMQPimCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20251104.gappssmtp.com header.i=@beagleboard-org.20251104.gappssmtp.com header.b=kQ29p482; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20251104.gappssmtp.com header.i=@beagleboard-org.20251104.gappssmtp.com header.b="kQ29p482"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso754153a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 22:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20251104.gappssmtp.com; s=20251104; t=1787289950; x=1787894750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MMTRiO2LCvL4OaL8CgkP71Q4mqWNH5wDDAfdSGoco2E=;
        b=kQ29p482uXFbslEWitBKKXKS1ov7Q9qG9vcRkcHqNYPXbbgo+DVM1zSTTbXVkUvzbE
         5lHdcairSl9hcwpIuwNo4yxnYr+S7k7c6G9r6Kdi46xtD8feOKaMXvtB8SiGsvQZD8c3
         oYPX4LMQ0MqCJbbuEj0SPcRwyt0c+8fPlTmXv4FJIEUmgHASoeaew/8KgDBPIu2O+TJR
         X91OuMxEFb22wtK4OL8NixXGpIbgfJ2BElHn+uGD1C2TAXJO3uLuXgZ6AEOUsyEXq+OS
         9wesmWGxwfNOkTWqc2jFnpvbOllFZIetSCYBQOEJ4IWXml5zWLgZDYGY+5PHTtrwTiCb
         EFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787289950; x=1787894750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MMTRiO2LCvL4OaL8CgkP71Q4mqWNH5wDDAfdSGoco2E=;
        b=Y7ys1RrCZeOZ/N1XXjeVZ6zy6QgPbQNJqavO4S6MgMGL/hXSB+FvNZGK1v1MArSNyk
         tan8y36tax/N90xhxfyx+gkkmdK4FVZ0c5Vljyf0M42GiI/2tZwrzgjBDqVwkr4ZHh1H
         ENqr0Fj2MpWINkL+xBpiaYJrf7W04R5mbs1sdZk/1bRLDx7odC3JNwibEA7SHqThj3rc
         w3WDfhXsQ3Ws41DjuGq5Q+aVcOn5VN7c4Hk0qSee3WNYGTnYwotJCYdRYUcy7ltXYZbr
         caI5KfOpSex5sjDoc9Gcnn0H5tBWm+AyWQ5vBtxDI4C8QKqKw9ExXy+HQxiSFZGADNYH
         Dk9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrV8biBO30bQ/+tUTnNZxj8g8IVDOg/cVRjAby67F3vUAFJTqXm0//QJ3RrNmGqG3+g4wDgT26NYgmsT4j72A==@vger.kernel.org
X-Gm-Message-State: AFuF++n7/5frTEyc6z6hAwVE/B8PDExUga0ZHyZbY75mYJ7e804I/5xz
	0c8q6pukfbI0SB4khF+eCnlQ0RfEktrw3DVduiIun3X3/HOcrTwkYitVqzpGTNcc1w==
X-Gm-Gg: AR+sD13KnRUv+QFbIc5zkLEvLC0W4bYPOdtus834loa2/h6LWz+/wQnGvPreXoil8cI
	kasVu35EWYZzhLfuvUlgP2MxfrrgnxzvI8x37N1TRNkfOP3TmYYBcCqc/Wo4rWN1gX+dI4O8xuQ
	XFxbMqQhANLLY8HMKVFDCxiZligfCExtuIv5egsOjdZGi8cf6Zuzc2PG3m3nD5XMC3becYIgoKw
	oipxXn9GNSQZMmP5uxIdPIHTFbjSd4G3mHPflrWSr8Y1MeEv2MD7gRTuMqOWOnow7l6IBiC96dI
	XlV3lo5GnBaYc3gqySeZOHoWFPa3AKEm02+11a/bsUQkarRBnpSidGhF/UPHlhG2QNKLsXvr69/
	xXRrm/HQb/ugJ+ms4TQO1aMfXI0vlrHBa4HTrFpestGV69hSMYpuJWXRhPhaRSZW6J1KcpOMN0P
	l8Hf4hOad8dRvsv26mToIscFxP6DfUhalWHaRHKQAfNHpTe9+2A8G4jAte883q48ylBQJhlXTkW
	kXzsvraZ3319gV01HoYZ7ETsEOg1f4aj+IxT9o=
X-Received: by 2002:a17:90b:3b4d:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-395c39b1750mr6047224a91.10.1787289950564;
        Thu, 20 Aug 2026 22:25:50 -0700 (PDT)
Received: from ?IPV6:2405:201:4019:32fc:3c55:6b24:5147:322b? ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm35061553c88.13.2026.08.20.22.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 22:25:50 -0700 (PDT)
Message-ID: <93977935-ea60-48de-9d13-23454e038c18@beagleboard.org>
Date: Fri, 21 Aug 2026 10:55:41 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] rust: crc_ccitt: add CRC-CCITT abstraction
To: Eric Biggers <ebiggers@kernel.org>
Cc: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Ard Biesheuvel <ardb@kernel.org>, Ayush Singh <ayush@beagleboard.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
References: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
 <20260820-gb-uart-transport-v1-3-282da14ab7b7@beagleboard.org>
 <20260821030018.GA1961@sol>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20260821030018.GA1961@sol>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/21/26 8:30 AM, Eric Biggers wrote:

> On Thu, Aug 20, 2026 at 02:55:45PM +0530, Ayush Singh wrote:
>> The module is gated behind the new RUST_CRC_CCITT_ABSTRACTIONS Kconfig
>> symbol, which selects CRC_CCITT, so the C library is only built when a
>> Rust user actually needs it.
>>
>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>> ---
>>   MAINTAINERS                     |  1 +
>>   lib/crc/Kconfig                 |  7 +++++++
>>   rust/bindings/bindings_helper.h |  1 +
>>   rust/kernel/crc_ccitt.rs        | 26 ++++++++++++++++++++++++++
>>   rust/kernel/lib.rs              |  2 ++
>>   5 files changed, 37 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6008f16ae2ca..1e3b42eff741 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -6921,6 +6921,7 @@ T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-ne
>>   F:	Documentation/staging/crc*
>>   F:	include/linux/crc*
>>   F:	lib/crc/
>> +F:	rust/kernel/crc*
>>   F:	scripts/gen-crc-consts.py
>>   
>>   CREATIVE SB0540
>> diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
>> index 927fc6a6b2b9..aceb8fe8f0ed 100644
>> --- a/lib/crc/Kconfig
>> +++ b/lib/crc/Kconfig
>> @@ -32,6 +32,13 @@ config CRC_CCITT
>>   	  The CRC-CCITT library functions.  Select this if your module uses any
>>   	  of the functions from <linux/crc-ccitt.h>.
>>   
>> +config RUST_CRC_CCITT_ABSTRACTIONS
>> +	bool "Rust CRC-CCITT abstractions"
>> +	depends on RUST
>> +	select CRC_CCITT
>> +	help
>> +	  This enables the Rust abstraction for the CRC-CCITT API.
> Like the other library kconfig symbols, this shouldn't have a prompt.
> It should just be selected by the other symbols that need it.

I was copying `RUST_SERIAL_DEV_BUS_ABSTRACTIONS`, which seems to have a 
prompt. Will remove in next revision.


>> diff --git a/rust/kernel/crc_ccitt.rs b/rust/kernel/crc_ccitt.rs
>> new file mode 100644
>> index 000000000000..6042ada16967
>> --- /dev/null
>> +++ b/rust/kernel/crc_ccitt.rs
> Is there a reason why the kconfig symbol is being put in lib/crc/ but
> the actual code is being put in rust/kernel/?  It seems inconsistent.
>
> - Eric


Was copying `RUST_SERIAL_DEV_BUS_ABSTRACTIONS`. It is also in 
`drivers/tty/serdev/Kconfig`.


The reason for introducing this symbol is that normally, crc_ccitt can 
be built as either builtin, a module, or just left out. However, for use 
from Rust abstractions, it can either be builtin, or left out. The 
module state is not supported. Is there a better way to deal with it?


Best Regards,

Ayush Singh

