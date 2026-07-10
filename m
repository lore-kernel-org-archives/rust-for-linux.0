Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEA9437123
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 15:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699133; cv=none; b=Z6O/r30+dHDabQCWIur5qo7psk7jPbchPftqVOHkwCe5oybzf0vaGs91FhbE2EFzzfbScGxlsOacYQOhC12XWqneKhpYq+nvGNAeQpondR889XZWssNY+eyDMkkN38Y0+lQmDSFUc0k3LTw9UzN9O3BQ0jRqRYoyVJqK2ZECSpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699133; c=relaxed/simple;
	bh=0OTiTiVSo0IDemovGfT3is8+e+GAuZ+PEePU+/MbCSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pOc5ff1g5/SGOsYmXotw2wJhqqOoiqLFscdjnBu2TlABE3WNXdyob7DiUZOg/9ljaH7QvlCV8EpfVNoQa8LfiE5eJn78g6oqdzJymtmj+VgF6bOnPjH12cTiItTfRGFrPDXNfUHsWyDwvkqviCUKLfQNxd5XHksY0z5/3s55llY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WmpG8nVe; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WmpG8nVe"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so9257355e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 08:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783699130; x=1784303930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Luf6olTEAQbJ7p+MoI/MDGQDIrig7h+9ncRK9wup6Vw=;
        b=WmpG8nVeD4kja5GqdytCXA5nuic9I2Ry70NaevlPn3gWJP/ahnSYXfv5vkTuLGBmPU
         5Q8D6OWrUkjsrKlcO7WTbTaIpCUrcgd43GMwJT28Zq2uTkp8iKnnej2DvyawENAu1DtV
         +zS7latUwe9hGSfd/hhpgkENCb8/udqQi/PEThS7ggETqJDiQdnT8R1aZUNbAm2q2Sg3
         XgivlXdqgJsl1IdCv6IlxiDx/N7vtM+OiPSJ3T95ZYbXJz5mmnJyWrRD1W6Y2FI/BOkx
         SBCjVeLr7OzlY2mPA54Bg0SDioVuWutC/LNJSLP+uUiuyLilCn8BtQtiC/KZ7/w5AiSI
         Nhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699130; x=1784303930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Luf6olTEAQbJ7p+MoI/MDGQDIrig7h+9ncRK9wup6Vw=;
        b=kDzRV+PoZ6TxObyEWUNwi+IwtdKSNvUic7YNFNii9sOXDuh+1+GmznFkbQxyFzfsF3
         sLJD8Qzhl6m3yMrWVPM1Si6xm/wsImcdcrb+ywEVmTcl3lKYQ+BSel1otOOYAKZc+A3k
         xZMie2yfdJp6X5+NmsTCbEuNkSHseBmt/7vkG50UDynIwqpAMkUfWwfMK701AtSbvBtC
         2RTPywGPusv24jD62ykYqH6Uur+FYRmkBVWURaRQXeMuX6KzZ+tHYfR7ACoOdWNHswX8
         BhpucE8y5gxGZkfFKrMzjIKN102WWopODxIhCx6cJ8GO6MdxFTlY0QYagQjMzuCbxyCV
         O4/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr5/Y3ylVKJMXAWuB69FY1vKf7dCLuoEqBjSOLs3ke0jCp2Sp2R+L11WEuAkMzHuNUreRAF7OWiFDd69qvznQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfgRs/9BLiMPqjVuZ7fqsEkxMsjr/aVde4M3O6Jon3YNrd+VAg
	5RsPhUQ5fLumwLMU9W0xy+ZLfXRTLMShHDoQoKL7L+t1zcwRTF8wHdG9GN8Y2xGLIws=
X-Gm-Gg: AfdE7cmk6zTLYqbXrmhuw/v9TT1iCLS6N3Ddt6nNig6aAJ2aD5Qblu8d1xt1UAP71Ei
	R36AT8/WS1PvKSzOg1oogrLXIe3QZfLOreATUNcsSOdoGxMZ00NPMus4qTWcAfMkj8eq63XrsyP
	LXVIJViSxStdpdrmy9/FSjhnF7YYjWysWrDrRU7s2sXlww4agLOBDmDiNBG6cCeT48YBVXSB12+
	SRQTngzojXTr0o+kQTyC0sP/ML2Y904cXmzQgmvunnIWRmeY2Lszf2gk7t92HXuSPsIHj06GW4x
	aP4vJ5r58ZnaOP5nEcNVU0ZcbEwB5HoWNTIltiwgu5tXHrn1lwSuGKI281iwTTrWuSEq02HVG8N
	MEUmzBIzRW5TKvOKZcxEWlEaL0bHcZgpAENpvsSmOMrb3oxStk7tQ+seCAQcdHGfTm8Ajj9PqAk
	ZCTQRfs/uBl9AuBDf00gpgYbwQQgpxkWBTsg==
X-Received: by 2002:a05:600c:3f0a:b0:490:e974:e006 with SMTP id 5b1f17b1804b1-493e68e8195mr120330845e9.29.1783699130249;
        Fri, 10 Jul 2026 08:58:50 -0700 (PDT)
Received: from [192.168.42.79] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6deb2a3sm5447229137.8.2026.07.10.08.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 08:58:49 -0700 (PDT)
Message-ID: <bd1f78bc-51b4-44b7-8e3c-7accc9e173f2@suse.com>
Date: Fri, 10 Jul 2026 17:58:44 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: module_param: return value by copy from `value`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260601-modules-value-ref-v2-1-12ebbf0510c9@kernel.org>
 <52feb9b1-2073-4fcf-b2d1-a7f42f1e72a5@suse.com>
 <CANiq72m3w7L5CmAsFvOpSh_jNk4jL8+A4vz8GEp+E8FY=TJcRA@mail.gmail.com>
 <30e500ce-e9e6-43cc-bbdf-ded7c0ae56cd@suse.com> <alEBInX9gD1M5NAr@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <alEBInX9gD1M5NAr@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/10/26 4:26 PM, Alice Ryhl wrote:
> On Fri, Jul 10, 2026 at 10:13:53AM +0200, Petr Pavlu wrote:
>> On 7/9/26 4:13 PM, Miguel Ojeda wrote:
>>> On Thu, Jul 9, 2026 at 1:48 PM Petr Pavlu <petr.pavlu@suse.com> wrote:
>>>>
>>>> @Miguel, please let me know if I should take this patch on modules-next,
>>>> or if you'd prefer for it to go through the Rust tree.
>>>
>>> Please feel free to take it through modules-next, of course.
>>
>> Thanks for the confirmation. Queued now on modules-next for v7.3-rc1.
> 
> I'm seeing this error on x86 with latest nightly rust compiler:
> 
> rust/kernel.o: error: objtool: _RINvNtCs65fqAZscXCv_6kernel12module_param9set_paramaEB4_() falls through to next function _RINvNtCs65fqAZscXCv_6kernel12module_param9set_paramhEB4_()
> rust/kernel.o: error: objtool: _RINvNtCs65fqAZscXCv_6kernel12module_param9set_paramhEB4_() falls through to next function _RINvNtCs65fqAZscXCv_6kernel12module_param9set_paramiEB4_()
> rust/kernel.o: error: objtool: _RINvNtCs65fqAZscXCv_6kernel12module_param9set_paramiEB4_() falls through to next function _RINvNtCs65fqAZscXCv_6kernel12module_param9set_paramjEB4_()
> rust/kernel.o: error: objtool: _RINvNtCs65fqAZscXCv_6kernel12module_param9set_paramjEB4_() falls through to next function _RINvNtCs65fqAZscXCv_6kernel12module_param9set_paramlEB4_()
> rust/kernel.o: error: objtool: _RINvNtCs65fqAZscXCv_6kernel12module_param9set_paramlEB4_() falls through to next function _RINvNtCs65fqAZscXCv_6kernel12module_param9set_parammEB4_()
> rust/kernel.o: error: objtool: _RINvNtCs65fqAZscXCv_6kernel12module_param9set_parammEB4_() falls through to next function _RINvNtCs65fqAZscXCv_6kernel12module_param9set_paramsEB4_()
> rust/kernel.o: error: objtool: _RINvNtCs65fqAZscXCv_6kernel12module_param9set_paramsEB4_() falls through to next function _RINvNtCs65fqAZscXCv_6kernel12module_param9set_paramtEB4_()
> rust/kernel.o: error: objtool: _RINvNtCs65fqAZscXCv_6kernel12module_param9set_paramtEB4_() falls through to next function _RINvNtCs65fqAZscXCv_6kernel12module_param9set_paramyEB4_()
> rust/kernel.o: error: objtool: _RINvNtCs65fqAZscXCv_6kernel12module_param9set_paramyEB4_() falls through to next function _RINvNvNtCs65fqAZscXCv_6kernel6devres16register_foreign8callbackINtNtCsbtRzKR1rrUg_4core3pin3PinINtNtNtB6_5alloc4kbox3BoxNtNtNtB6_3pci3irq21IrqVectorRegistrationNtNtB1A_9allocator7KmallocEEEB6_()
> rust/kernel.o: error: objtool: _RNvMNtCs65fqAZscXCv_6kernel6deviceNtB2_6Device10get_device() falls through to next function _RNvMNtCs65fqAZscXCv_6kernel6devresINtB2_6DevresNtNtB4_3i2c12RegistrationE19devres_node_releaseB4_()
> rust/kernel.o: error: objtool: _RNvMNtCs65fqAZscXCv_6kernel6devresINtB2_6DevresNtNtB4_3i2c12RegistrationE19devres_node_releaseB4_() falls through to next function _RNvMNtCs65fqAZscXCv_6kernel6devresINtB2_6DevresNtNtB4_3i2c12RegistrationE21devres_node_free_nodeB4_()
> 
> I understand this is probably due to a new function in Rust stdlib that
> is no_return, so probably not caused by this patch even if this is
> triggering it.

I can't immediately reproduce this issue. I tried with linux-next
(next-20260710), rustc 1.99.0-nightly (af3d95584 2026-07-09) and
x86_64_defconfig with Rust enabled. What am I missing? Could you send me
your config and the produced rust/kernel.o off-list?

-- 
Thanks,
Petr
