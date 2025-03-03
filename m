Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C92B1EE7D9
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 16:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741020738; cv=none; b=OiQD9mstZotHkjqp13qKzFe+XALi3sbeINk0D8fOl12FyZUwKgKHjeOQkYhmAikloiBx9xdtkNzfyyegB0dHKINz2f3qC+MaBIm9Us+jF0jDq83tk35fYHyFf5VUsanj4Lf46T/3IobU4k/pJECMHt0Zk7LHFTJXnVE62xDQZ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741020738; c=relaxed/simple;
	bh=X9vuxKvJBiI5voDqnbl4lgtxLuulj8GAfFRersEJ2U8=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ML9zmvBpHb2F5knyAdwQzFZp47MpV/sJ7rFO6KIdmgN9WInbfjnh8t029J7JYo9EFn5qHqIOJCVD+73FPr1hStvAuVsYmFQc5LkdDQNckTLNseamhdD3UaTrCiHr7DovJoVOkiloI3CATFKwr9TGBPhHwSLAHdDZqju2pbXagoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VU+6aHpI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VU+6aHpI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741020736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9vuxKvJBiI5voDqnbl4lgtxLuulj8GAfFRersEJ2U8=;
	b=VU+6aHpIrxqqy3pMAJatFHOXSsfeKTxLdo+Y6IIstJGcSy9my9zTWWlp+365pcTodbr6Z9
	K14vVAdThzL4A3KhrMvXNaqZ1KSHD5Q0P5k6n2LRS9ftxCP6SoRFOOVmJ5iLBh07zBaZK2
	QvZdi6bfc8xqekqoUeuYY8xIokojh3s=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-g8qrTVerO1mwKbDCA_VF1w-1; Mon, 03 Mar 2025 11:52:15 -0500
X-MC-Unique: g8qrTVerO1mwKbDCA_VF1w-1
X-Mimecast-MFC-AGG-ID: g8qrTVerO1mwKbDCA_VF1w_1741020734
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-471f3077d39so104587231cf.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 08:52:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741020734; x=1741625534;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X9vuxKvJBiI5voDqnbl4lgtxLuulj8GAfFRersEJ2U8=;
        b=IRxfFVLGwuA6e0PoJJ73aPsom+J+DbmDmWBAU5DHFNTuShI1SrmOBEmQJakMJUX0Fw
         SrVEuBfZU+SUuEjaXqWNJSMpTkNPXZIHu5ByiSw0YC5K5QXkdgdqPdR3AHJjRwSjvBbE
         nLK2s0+DTX8lSJgRT2+sS6tretm0Nd7tVaLeGCla3pfiRXYBkLphRiHeWkB5tl1wuQqj
         RaWsIQ92lexAbj0xcd5QcGT5jAoCItnzhLkBNY64nVxOG9IyTwrexsa3lIEVCqE/zNOY
         Waw9hcjivF+I3YjNHkLWJSqS9M8feXbpxBSQRIUgCDck0oBXV3I/HI/4G+HBB8RU1MM0
         JHPg==
X-Forwarded-Encrypted: i=1; AJvYcCWURIZr2j1BqbeEAtyogMIg6tFW1nAw1BSK5HWr18wFa3ayFv/z23s0FX8VjcQBBhhqytAOkYM6Z9RbzTsfkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxovRQc+F06ZYurqzaB482EdyzHHbJoMFARFP5yU1j8Gd26ldU/
	sN8Uo+is44u6xXTbZg+D7+7lJxoGXXSZ/rQViq0n758zaF1wOHTvg3I67t/zV4Kdv+kCc37Jhqy
	KmnWUD0OuE5SBIlQD5BESmR1qqcI5E1cwSM0kGwqgyqXzqbLZMjvBt1OrYIQEjoL/
X-Gm-Gg: ASbGncv0XQilla4GhE1WC90ory2i7CqtWBUpV6Ep1rATq0A+838osJANTdmaI2CzMLm
	6w8CnC58VI2Umzryz9vWV9zuPPVZYHWV/cooph+v86L7bsgpOoV5Vpq7sL6nRKxueJgbGSx/zzi
	P06WejvPeqZAT/K39//443c84HAvceNRhgrIiJMQ29AHDYA0ivZJ+nrDkYhMKi72iRScuxewHNx
	HBxBwnnqsbj9Z2UhgSYBXIzE305TiBbK2eWE5Oo3hkj2c4XqIs6/Eq7t0Dhea7IT7vnmLUJWtzV
	c4gVmFQQPkIqwH5cPLMuGdEAhoAuIhKyxmUUlqb65MkgNlaw4+xG2wf2zRw=
X-Received: by 2002:ac8:7d85:0:b0:474:e4bd:240f with SMTP id d75a77b69052e-474e4bd2933mr76620401cf.15.1741020734605;
        Mon, 03 Mar 2025 08:52:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESSqcVQ5BVQ40j7IqzCcdGGkpDty4sSfwg8hSbBvllBwbMi0l4DwBjqREU0L+0P4dQsuTKlA==
X-Received: by 2002:ac8:7d85:0:b0:474:e4bd:240f with SMTP id d75a77b69052e-474e4bd2933mr76620091cf.15.1741020734300;
        Mon, 03 Mar 2025 08:52:14 -0800 (PST)
Received: from ?IPV6:2601:188:c100:5710:627d:9ff:fe85:9ade? ([2601:188:c100:5710:627d:9ff:fe85:9ade])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474691a11fdsm60247171cf.15.2025.03.03.08.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 08:52:13 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <efe964ad-9b14-48b9-9dab-30f29263191b@redhat.com>
Date: Mon, 3 Mar 2025 11:52:12 -0500
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] LOCKDEP and Rust locking changes for v6.15
To: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>
References: <Z76Uk1d4SHPwVD6n@Mac.home> <Z8IHIYOnI-DMHlC8@boqun-archlinux>
In-Reply-To: <Z8IHIYOnI-DMHlC8@boqun-archlinux>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u5S_Bue_GszC1fnIy8lm0kHTWP_Tg6LFyi5xr0re8bQ_1741020734
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/28/25 1:57 PM, Boqun Feng wrote:
> On Tue, Feb 25, 2025 at 08:12:03PM -0800, Boqun Feng wrote:
>> Hi Peter & Ingo,
>>
> Ping ;-)

Hi Peter, are you going to pull this lockep branch into tip?

Thanks,
Longman

