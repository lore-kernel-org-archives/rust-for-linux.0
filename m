Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9346372618
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 21:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765489842; cv=none; b=eR5qXxO09N1+VmW1lnTmMmPKiSlep2Q1UWrbHkIZoAFrum2WVannvOd1ekBwnPOpYZwTCN+OfmDYon1P+PbbRbTk6wmxivx7iG6nsVoLUltG05fJdkGj2bSGhC21ynzJKB29xABfbicU9+W14YCLupFMl9iW11z9ak0en8AIjPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765489842; c=relaxed/simple;
	bh=Jhk+Al8qS1UMPn9v1MerQ6tcNUNRQ5Zq0h4sP4RFvFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmGML8nN+yqyCJxpb7PgQkcc1Wts1FW0MCuxT81fSBIGQ1P9j4byFM3StT5MG6xVyIka4GxtpCW3RwKysohP+pGeOVthgqTPheHgUiMhtW/QOovwO71F6n2NVQtLj19ZmWkZIvWC7EO1ZYNZpylCmU1nht+VWymx7FbDkqlnTCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uj+nR9XV; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uj+nR9XV"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42e2e167067so282173f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 13:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765489839; x=1766094639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a82PJh8eepOGqCmiI3UPw9D1KL6YO5opvGRf2gsxoCk=;
        b=Uj+nR9XVZi5eM7ox0u9xPVBT9x5Vmw/jz2pPwK7tyR0XwCHlE2poIsJ8B/rnphGPc2
         IAx1vl7m6F/9y866ojgiNO2myiwIr3yZzB4Mm5ICxBkMUOB8OImIIIol8q5eUF6eEnQP
         /461o7Bpftq2u1XB9NEqv+4pKpxHFPqaAHS3erSQCAO4NFkWSrpJOVYusQUxJzBFA2cN
         adPcv7fzpoqW1467ElauX5tRnaeHH+UDe8oFotJnFCtUERUUHcMtzXxv6ZGwHdwj/aw/
         asrINcBw6BrRHgyWeZtqBLznrkehpTqAUdutw88VYMs0io0vjK72F3xiwZS/f0HdPwuG
         aJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765489839; x=1766094639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a82PJh8eepOGqCmiI3UPw9D1KL6YO5opvGRf2gsxoCk=;
        b=cK8qts8/0fEgIzt11QHpNefrJzEK5nruyE1yGFjmfkGR+vQDSVsAGT7V0vIXS4KuXh
         nyQxc20NAssyOBhWXqAoD1NOMYl5csMLBqu73QsSAuzYj3yUdsG/MHfL00PT1VW6QbRr
         aBTsJiEZONbfBJiYiSwEqklT9GZF6Yt+GI5NmmGEQ5Ee4QR/WPlVkzrzoFhwrHdwx3tt
         b42N6DkDbUulxczbxeWIB+Noc77/tgXiUZUybrKgXJv4SJbZmEh3uft+BOX/dYhUKKof
         0VYHBUEe28mZiODJlBxfOrx3CIBvOaj4LRh/8xzB9xmTkjzWJG6e8C+g0afC5dW+nl32
         QvTw==
X-Gm-Message-State: AOJu0Yw/5nrpKDK4n6Msxz6EqWRMzyap3tWgdOkdL9maXSi9y8AHYbgN
	PmA/ZGtwJVjvivWpQ1ANKq39qhzFecQjhhXMW4Gmc84G4VWywL6YEzVu
X-Gm-Gg: AY/fxX7QFTH2rKT4tOqtoQ80IK3EH3zyK8pdG4QPYICt+TuRM3fkBlezuuOBHp2uhMZ
	l83RIkFiWmgAweZ5fPrYECHEdp0bGxC1e7CBmzg3uqsaxzUZv49XDS5g9FSO66dPubNJG4twmL7
	M/jZLEHl208G7LUhxENcZySZLdcp7vT84FzwjFGGSiZMncopj4Cc9HUh5DPPUA9qvPBX90u1/v2
	BKWuZJFUJGfbe8Z86Go/V5AZI2RXlpd4eA5GsO8tPbibDUIYRATSdD8A9MaAbmkE/vbfOi6dmzn
	nNXvhEGmtYQZcU4g5IGAMLs5iAAXOikPEcGGQxPI8aqEUAFxP62qqNvvXIcBkycTjzEPGF84ynA
	zrMdSRL3dcOu/kOm0EJPO8jjfd8S1dgy+JR3KIm4u8uORfQKEHBAhY3e5M/PrRMUeWyHevbgAXT
	qdjE8v4Snlf6p8dQycCaZ4O28D
X-Google-Smtp-Source: AGHT+IGSpJWsBGIsYUG6VjxkL05+z9cNzHzqC4vUarsrFQWSwtTrv3gNIa2zRBVmWI/2d0ZM6095eA==
X-Received: by 2002:a5d:5f95:0:b0:42b:549d:cdfd with SMTP id ffacd0b85a97d-42fa39d92d2mr7526757f8f.2.1765489838697;
        Thu, 11 Dec 2025 13:50:38 -0800 (PST)
Received: from ?IPV6:2001:871:22a:3342::1ad1? ([2001:871:22a:3342::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b85f81sm8941712f8f.21.2025.12.11.13.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 13:50:38 -0800 (PST)
Message-ID: <f3699da2-288a-4743-895a-f54daa1a51e7@gmail.com>
Date: Thu, 11 Dec 2025 22:50:35 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] rust: pin-init: internal: remove proc-macro[2] and
 quote workarounds
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Fiona Behrens <me@Kloenk.dev>
Cc: rust-for-linux@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>,
 linux-kernel@vger.kernel.org
References: <20251211185805.2835633-1-gary@kernel.org>
 <20251211185805.2835633-2-gary@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20251211185805.2835633-2-gary@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Gary,

On 12/11/25 7:56 PM, Gary Guo wrote:
> From: Benno Lossin <lossin@kernel.org>
> 
> The kernel only had the `proc-macro` library available, whereas the
> user-space version also used `proc-macro2` and `quote`. Now both are
> available to the kernel, making it possible to remove the workarounds.
> 
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---

Its good to see some workarounds/hacks get removed!

Overall seems fine, but maybe the imports should be changed to the
multiline kernel style?

Anyways:

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

Cheers
Christian
