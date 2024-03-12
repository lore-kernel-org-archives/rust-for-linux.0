Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253E769976
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Mar 2024 08:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710230918; cv=none; b=Wm/FKphsFjLOiEVXD1WrkVKypN8ZI3DsH1sEPkqg+VXMSyqC0GTLbfY0Whu+3TkP0vM0OelsJtzCRuZdPRqF1Eq9pWLoUQmiUH7qp+s0jn9xATPPgDNd/l8XQiDozi/5DwPeau27V/jr5X0HmtulAnlylxSEA5U9cl3pp/k5uCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710230918; c=relaxed/simple;
	bh=LPn37D0zA4HDuoko8dzIeyqSJ4L8OsaTlUTSJHhe8Z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGdYveID5LIX/pvQvvH6Ywjah0srr8LwXoH+WXAM0YDpbv5CeP7/uGTb4wOj01vcT3gUiBEcBaGwzBMqMG6Sj/4XT5nGHvVHxIJ55b0J4rICHkjtZj1DnapcaTWtxoN4+IOPaG4hc0FUw77fjDRQlIkw4EcWLbFs9zj3t9Vih3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OyzqH7Hv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OyzqH7Hv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710230916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O2/rmYdA4+aZzxntlZRJDjLbuScRrLz7GRFyLSa8T5I=;
	b=OyzqH7HvqfCQCUXiC/90UawpboSZcG1l4wE/byklzccGRZJ41oR3xzZ4qo8KL4cCy6ld5G
	VtBMRr3dhiPbFFiTIVi24tUaQGLTZj4Ix8MDujkas+itu9yB11Jq1A8g04Mr4CPn2R4cBd
	67BCh2iEgAaBPKPg1vG+Nzn4KAyq+8Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-RW-hBORwP8qTeQ3vlaOOKA-1; Tue, 12 Mar 2024 04:08:34 -0400
X-MC-Unique: RW-hBORwP8qTeQ3vlaOOKA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-33e9203e775so1237160f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Mar 2024 01:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710230913; x=1710835713;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2/rmYdA4+aZzxntlZRJDjLbuScRrLz7GRFyLSa8T5I=;
        b=r5hsDMbmo6PgI07E8p0QQLieXL4cRISspp+JmT8nGLTTXdRRPVBw8VcMUlY+eCDGT7
         6otr7cSiBGk3jYxPzQvxb01T1AQMUTcYmPB1DmmdalTEIAxUaszTsq/j6EByxzTs9GWF
         Ajo0618MyfWm8/2HYQZJ5kRcSfyomGL8iBBsaHp0iUa0emqI39R2dOLpxcvNuO7L7c+O
         dITcryqs7vRhp/gnESfMStoBY6TM5PlyI22LhC3sgyu8PX2yI/ClWXfNVo1SEDbpH4Xz
         1uykgR1qrbgNx3TcEiEcc01SQCadhlAGLhOpmqmuL0wjxXd2MfjgLiB9ovmc/xQWBaVB
         yNsg==
X-Forwarded-Encrypted: i=1; AJvYcCXTECLgoilSpwDZpHxkVXwCQrTrTW8ibcGxegRgb3wNGMuJGcbAC8hutK3nHgTNoOP2kqnhiv2qmMnf6c9SccKZ9ZT5/OjE79AcxuOfGnc=
X-Gm-Message-State: AOJu0Yzd6lYy7ffG/TCCT4wqoppT0uwthjyqr2TxwK9u4kBN3wbFHoog
	jrB9ZU+fFtFV4SEBtxCmHDw46JYYqtqn0+xhVZGvqcWvmArAC8QZjjtSzO5p5N9BOB3HzAcYIUa
	Iw7IfkzJpkSCuZGNIdOT0dcvI5x7jPK48ZuyFxBRlF0DQRPUjw4aT8F0yrAFtflqg
X-Received: by 2002:a5d:5012:0:b0:33e:1560:71a8 with SMTP id e18-20020a5d5012000000b0033e156071a8mr6008820wrt.7.1710230913656;
        Tue, 12 Mar 2024 01:08:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbIvRLSVeeC7KBq7sBGihqLHQXW7BdA0Q6OrHys5PEY/vV9zGL2DS8+VeL3K+WRBa2nrn5HQ==
X-Received: by 2002:a5d:5012:0:b0:33e:1560:71a8 with SMTP id e18-20020a5d5012000000b0033e156071a8mr6008804wrt.7.1710230913293;
        Tue, 12 Mar 2024 01:08:33 -0700 (PDT)
Received: from [10.32.64.131] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id h11-20020a5d548b000000b0033e3a24f17esm8426405wrv.76.2024.03.12.01.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 01:08:32 -0700 (PDT)
Message-ID: <d0159c8c-f5d8-4731-a820-012702841bfc@redhat.com>
Date: Tue, 12 Mar 2024 09:08:31 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] rust: str: add {make,to}_{upper,lower}case() to
 CString
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240223163726.12397-1-dakr@redhat.com>
 <6ba16a74-6fa4-4051-8cc6-f0e53a68d8b4@redhat.com>
 <Ze73aPMEg-BUCE8W@hs01.dakr.org>
 <CANiq72kK5CF0RQathACD_=7K1Ye4eMVdUnRcvkDZx4ALtq46wg@mail.gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <CANiq72kK5CF0RQathACD_=7K1Ye4eMVdUnRcvkDZx4ALtq46wg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/11/24 14:10, Miguel Ojeda wrote:
> On Mon, Mar 11, 2024 at 1:22 PM Danilo Krummrich <dakr@redhat.com> wrote:
>>
>> It doesn't seem there's any further feedback, thus can this be merged?
> 
> No, it cannot be applied until the merge window closes, i.e. 2 weeks from now.
> 
> Please note that there are other patches yet to be applied that were
> sent before this v5 -- we aim to send early PRs to Linus, and in
> general for at least a week in -next and for at least a week for
> review. Thus -rc5/6 is already quite late in general.

Thanks for sharing, that sounds all good. Just wanted to know if the
patch was queued up.

- Danilo

> 
> Cheers,
> Miguel
> 

