Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5453DEAD3
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 07:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782719995; cv=none; b=Vots8zpn+xeF0euK4RHa+iqtnwghpWd5jN2CD9v+/eMVBYTsxDUmZcsfPeolDQzXpuUMkv32jKCRkJUb7Ub9ue0TDsh8PTxBVNaAbehS4AI4z4UZhRayy4it5pEMpXgqX8Kg435U8Jsb2UPNO4+VjlEteBfauXN9jISx/ZdJ7QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782719995; c=relaxed/simple;
	bh=Fjh6McgL6DD/8o9fAgQe2P5kMAp4EdOgL+d2WCEdkpw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=a0uw4azylLyXtVw/2yupML53ntzH9Bw63VLs00399338QZn0INGdoWknTqVrGyLyQayRUeSFgGS29wMipLj47QneW2ATXCDy3uQBiuT/wTtJ3rpML29mdxjBy3UXSArT5UzK4ijmADqltiIQo5aHP4E2zgqVjH2ILx7Mks5937Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqeCnxgb; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqeCnxgb"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c9abe1c505so7975625ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 00:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782719993; x=1783324793; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rezmMRoW0TY1v4PkJTz+2piz1eElRyv9KkMLuNl5nCA=;
        b=FqeCnxgb64tqjHs6F3+6qBPxDUQI2lhsatYuF7/KSJYTCImr4rbuaeMbq5QPnqOkKi
         0dW+7gFwwBfo6C8J0cW/XRWlcEQsbciDmQkKNLtGofjBJttTAhskiqVXEg6M0eohp+Jo
         O93Lu/IVzpTX54cTdiphQFr6eEJ1I2glAoT9Xpehkl2bEw6NGtDmpUWwQS4geatRwwX0
         YiBlT8Fl2RG6OwL8dvT3sPK7dOjS/IIazP4OWCn/yC9olz4P9ubjM/3xcdRsyWC0/qQU
         R5+0Q8SGUJASOryqxYCvW9DQ8eknc0UtebkQyfCcD2Pxf9a40+gMt8xKZFKDYe2V3UHS
         IBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782719993; x=1783324793;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rezmMRoW0TY1v4PkJTz+2piz1eElRyv9KkMLuNl5nCA=;
        b=ksC7lP7hvJCeRzRVuhlO+tb+DXqNZbX3YNtdqL0UeDRSPLQ3Hmtw0j1sk+oNugxnSd
         /Ft/ilorLCAoo7q2ovr3KH+iyAF+qdtjo1JA/OYKV5jN7l7q02KtfJHUZEcSdPaTyGWg
         kMnYqudBU7CaMuukSUD8k98babKH+C5ymc4/QVkWC/Vf0J0GK22PhqIQhgGsacQGmjjV
         L3Zph04BN7hoY0rYQlSIuW8UJl3YZDkmQAF2m9+W53YVOLxOa8FxjljA710hdFdrbrpV
         ieU1BEtc2IMuiw1003yC84zqMFRDHoUNkV3/mK0N6GR1xzkYWPNP3dVMo82N6zWM2izv
         rUpw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8aYWZrlt4g1auQ/J24aP5efOjm4z8svFbCXn3cfoCAojteCX6a7X1nONMee6kUe35FzFjy8cW7EFghGvY4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYgBG+03XeskRIMuPn0v1W8qzuiQ4917EzFQfrCKzd8J31P8IV
	P6si6S3NtYvEV1W+YLQn49MlPAdoLaD4AjSKQ1WSrV1XNTz5sfkoaL3r
X-Gm-Gg: AfdE7cm/VO1MeqUEb6dABhocF/0WHugczVtOJ5SlUgLwiyS171741E91cX2L5kFHgPz
	1kx05PP1GRbPPHoIJ0mzFC1aYkHgQ9fYZ4MX6PdZGq3rUdtg7eKUrTqfr+FBJiKcLD7VgN5z0B3
	KBK5Ql6x2Ui7EKRfUfDjiK2LXOAeGvvjhvkUT4N8UG+Nb7xFsq2VIl0CXBLxVDm734MVPrLlFpR
	GuaYm5QXSIAHSNCGeAp0gi8Lj61QGQb/1QfgAqlDuIuaPsUVnd+Z3mA+BbfeSZKaUje+hMvthaQ
	Q0jDA7djbv1rZY4gx9r0nfq3o4GlNtOywZlf80tvuxA5wAlJkY+37Uujz6aHnd7HbIKH6+zm+Vj
	XGqtmdecW2WcOexJ9g1Q/4HWBeaN9NIBToHcFI/RVvpEgMxbwKti3EczYqQa/PQLAScd8/YSEJs
	Z6hL6AE6D34V9Q2lRT0O5g9bY1XQyNIwvmEGjIMme5lKSom8LrYXrjIDcHef8/LQzLzjztiPzIV
	asFMbhhL70dGLxERA3ywjr7kJ54Ua73FqiIfXYy
X-Received: by 2002:a17:903:2443:b0:2c9:ceb9:865b with SMTP id d9443c01a7336-2c9ceb989a7mr46743485ad.21.1782719993052;
        Mon, 29 Jun 2026 00:59:53 -0700 (PDT)
Received: from localhost ([143.248.188.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9cd6916e3sm32503885ad.40.2026.06.29.00.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 00:59:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 07:59:48 +0000
Message-Id: <DJLDHST0Y4ML.68M47LW7EDG4@gmail.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "SeungJong Ha"
 <engineer.jjhama@gmail.com>
Cc: <sashiko-reviews@lists.linux.dev>, <ojeda@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH RFC 4/4] gpu: nova-core: gsp: convert GspMem to zerocopy
 via the transmute bridge
From: "SeungJong Ha" <engineer.jjhama@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260628-dma-zerocopy-bridge-v1-0-9a2895ebe30d@gmail.com>
 <20260628-dma-zerocopy-bridge-v1-4-9a2895ebe30d@gmail.com>
 <20260628172200.B116D1F000E9@smtp.kernel.org>
 <20260628182154.712621-1-engineer.jjhama@gmail.com>
 <DJLCGEB0ZTL7.3C1BGJRHW35HC@nvidia.com>
In-Reply-To: <DJLCGEB0ZTL7.3C1BGJRHW35HC@nvidia.com>

On Mon Jun 29, 2026 at 4:10 PM JST, Alexandre Courbot wrote:
> On Mon Jun 29, 2026 at 3:21 AM JST, SeungJong Ha wrote:
>> On Sun Jun 28, 2026 at 5:22 PM UTC, Sashiko AI review wrote:
>>> This isn't a bug introduced by this patch, but could this coherent shar=
ed
>>> memory lead to a time-of-check to time-of-use vulnerability?
>>>
>>> The driver validates lengths and checksums by reading fields like lengt=
h
>>> from GspMsgElement, which is mapped directly into shared memory. For
>>> instance, in wait_for_msg():
>>>
>>> wait_for_msg()
>>>     let (header, slice_1) =3D GspMsgElement::from_bytes_prefix(slice_1)=
.ok_or(EIO)?;
>>>
>>> However, receive_msg() seems to re-read the header fields directly from
>>> shared memory to advance the ring buffer pointer:
>>>
>>> receive_msg()
>>>     self.gsp_mem.advance_cpu_read_ptr(u32::try_from(
>>>         message.header.length().div_ceil(GSP_PAGE_SIZE),
>>>     )?);
>>>
>>> Can a compromised hardware component modify the message length concurre=
ntly
>>> after the initial validation but before pointer advancement, potentiall=
y
>>> corrupting the host read pointer?
>>>
>>> Similarly, send_single_command() initializes a message header in shared
>>> memory and then reads its element_count to advance the write pointer:
>>>
>>> send_single_command()
>>>     let elem_count =3D dst.header.element_count();
>>>     self.seq +=3D 1;
>>>     self.gsp_mem.advance_cpu_write_ptr(elem_count);
>>>
>>> Does this allow the device to race and corrupt the host write pointer b=
y
>>> modifying element_count before it is read back?
>>
>> This is pre-existing and not changed by this patch: it only makes
>> explicit (via a checked `zerocopy` derive) what the previous `unsafe
>> impl transmute::{FromBytes, AsBytes}` already allowed implicitly -- the
>> layout is byte-identical and the message-handling path is untouched -- s=
o
>> it neither introduces nor addresses this. I'm not familiar enough with
>> the GSP threat model to judge whether the TOCTOU is in scope here; if it
>> is worth noting, I can add a TODO comment near the affected reads.
>
> So I understand that this as a copy-pasted Claude/Sashiko block, but
> would also appreciate if the human behind the keyboard could provide the
> context required to easily understand which part of the code this is
> about.

Sorry, that reply was an unedited block. Here is the concrete context.

It is the message-queue read path in gsp/cmdq.rs (wait_for_msg() /
receive_msg() / send_single_command()).
I haven't touched that logic; this patch only swaps the unsafe transmute
impls for a checked zerocopy derive. If it's worth noting, I'm happy to add
a comment near those reads.

Thanks,
SeungJong

