Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D181036494F
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 06:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786342832; cv=none; b=pIwjmOeYJTE0cXyuJwBXrgh1VBw6hnClnxdhQtEY5ojm67GXYe51cr/nQhpY8rNiE7WrylQMAT6yGANG4NwL2UFG1wTgEuH94QsWvritBJ3w8Gs5YQADOImWGW3eTKh3RJRmWgvFQdWPbyWOVMLmTxc1Gvv4S+hIS/tbn3Jkmg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786342832; c=relaxed/simple;
	bh=qCdHI4q+JAJn8GYn/GyoNp7Jg298t7ZoBwvUd+XHUBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eDK8F9EdJPAN+rmfwlBYSz0EYxfYNxQkumF39ea0ind+p8SGK5jCk3ZGXcGTt6d7yu0iqDaTEZDAji+q65DvyAOclvNGJQgq8ipWl+8fZ4Sglai70LxxQeZ/q3d5vnCuyMQok72MhgcW4KU7XZajS/RwCh79sVhGloCaek/n/2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc73e322dbso14826855ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Aug 2026 23:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786342829; x=1786947629;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ce37vW5Ygy9fDCjuGuLolMwZG353egtXS1UaX/wQZWs=;
        b=oTIujO0KemEEhyJunHyBuojnbJ7Muj10ckNqFTpRZGCCiWuXxjQApq2vnp1VhCseGY
         8JFVWMTJVw94jxKORiTuNRWsq83fJ6i67ZHCssMvYIYPNpGpFDxr4/tByM8MqUsEjBs1
         zqmwLjntaNweO+5EBgjAN4IcouOH7VxLPc2JODenR14vCwL3bKI0snUPxxFqcAepIPgT
         AfFkXp4LMIegcUsbKIuKRSHFdmuxuXEiAhhLFIn0/fWk8lQx1+Bj59tOO83LkFLmrlxo
         67XoIxpfKKk3GS2KyyeKxf/U4+UW3DTG4tSpGCOzESlh167JmBE+0BpbnKOulamBtlRL
         8L2A==
X-Forwarded-Encrypted: i=1; AHgh+RqKk2OPnL874+PW0KpNd//da3ffduEvux61U05iwNcF2mY07f6kFWpNLcbDwnMQRIbaZtYzwTlF0BvKdwSkfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBMZclk6OuV0GB5cVhaZpup1oeKaRo7AtLG6Gfit/NjsCHQayy
	7/DxvPJ9GuW3T5Y1uO7w8O/fbEIsiWbYwIg4YF1PPfaO+t0z7gGb5mgy
X-Gm-Gg: AR+sD11IpsnDBUK9LdTQQG0FtCZHMXSNZ5IMV+SiNLKtD+esL+8kWaoU3RFRwJttfVH
	Sk+ACfAwWIoeytdnZtZt6ZnYerWoNOWGBcjFUspWxzNfTfpOcFC6Vk6VcKMyZPP/QFBLquxgZVR
	yotfk6GoAfZJTLgzJmwTZ4VMYZY3OS4o2Lkt9hl3hbzGI2gHccSIWVJ3yicOalTIjw+DEuLwJyu
	AuXIXdL0oCSPwX/VEacZm9EGgalM1lOad+8gV00yu0uSjHnrSXZnGEdwTirADDlqN/eWcsVw8+j
	PHLlfla+Stg9pcYLSfC3cNprN5JtFGYnV0U91mVaYnIfLO7kHZku4PEzXAV8sGSlCLUE/50vW/z
	8wmgwugP7NOTMVD4su9xY1hzphYDx/zF7NjX+jTNug58ayCVZonQX2oMBrvfgmVjR/PF+dxKUww
	EzpF6jWrJEQWzrtOimvi8QmCOZvc2N
X-Received: by 2002:a17:903:2392:b0:2d0:cc92:f7af with SMTP id d9443c01a7336-2d0cc930358mr481776485ad.9.1786342829101;
        Sun, 09 Aug 2026 23:20:29 -0700 (PDT)
Received: from [10.0.11.3] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14cce7830sm29088695ad.29.2026.08.09.23.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 23:20:28 -0700 (PDT)
Message-ID: <f17f2192-f691-4144-9c12-882d3e528753@kylinos.cn>
Date: Mon, 10 Aug 2026 14:20:19 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/2] rust: fmt: route {:p} through HashedPtr to
 prevent address leaks
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
References: <20260807-hashedptr-v14-0-817009769ffb@kylinos.cn>
 <20260807-hashedptr-v14-2-817009769ffb@kylinos.cn>
 <CANiq72=urinBJ52pS+pS3zOdhCXC9hgCAU8NJjVqyw87ZQ4gQg@mail.gmail.com>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <CANiq72=urinBJ52pS+pS3zOdhCXC9hgCAU8NJjVqyw87ZQ4gQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/10/26 03:50, Miguel Ojeda wrote:
> On Fri, Aug 7, 2026 at 10:15 AM Ke Sun <sunke@kylinos.cn> wrote:
>> +        // SAFETY: `buf` is a valid, writable 32-byte buffer, sufficient for
>> +        // all architectures (max 19 bytes for 64-bit under the default width).
>> +        // The format string is null-terminated; `width` (c_int) and pointer
>> +        // match the `%*` and `%p` specifiers.
>> +        let len = unsafe {
>> +            crate::bindings::scnprintf(
>> +                buf.as_mut_ptr().cast(),
>> +                buf.len(),
>> +                c"%#0*p".as_char_ptr(),
>> +                width,
>> +                self.0.cast::<c_void>(),
>> +            )
>> +        };
> I think Sashiko is right, we probably want to restrict the user width
> to as much as the buffer size minus one, e.g. in the `match`:
>
>    w.min(buf.len() - 1)
>
> And we probably want to add a test or two for the boundary cases there.
>
> If someone really needs a longer width, we can always revisit, but I
> suspect not.
>
> Ke: do you think you can resubmit with that?

Sure, done — width clamped and a few tests added. Will send once
testing is done.

Best regards,
Ke

>
> Thanks!
>
> Cheers,
> Miguel
>
