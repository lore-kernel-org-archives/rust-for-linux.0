Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA326D1C1
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Jun 2024 07:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719474087; cv=none; b=EfYpr95Evb36GyYPS3nW1d+aDh6kuiPCOE7WA2Zoy0TgOldk7TdDjeJilB46ldaJeYHpy2XnPLML67PdToWUShYlipukPTxwxu3d934Vjd9ORvBxluquW4lwOYdB9OM7pSTA8nUCz3rfN3k8Ranmxq+mJYZllsIUw2/6/xi8qR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719474087; c=relaxed/simple;
	bh=ibOAOBns5oeEsMpjEHj0qObW3A1T5Ei34xDQRATtqRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=MpI1SuZv27sofgQjemZfrn9OOhImY5l0X+04gzJAgUpdZMoG30GRcZQNQc+bdO6RzE3XIbyhW0Cz+OVpx/+5puLHY7i86phBVPeXvkuZTzCBzCwFHIZCpPwI4M5dyRrU/PFJA25q8dh99XKkc4QF6qSN16Uf7gU1zAoWG52x4QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eeMu2ODi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eeMu2ODi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719474084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KDFpMT/o6TA3HhPIsNw7m21U54PqATB7NjiG2R0C4Rs=;
	b=eeMu2ODiheRqbS2AjkzcWovftN/VtVyiftNM+YOUpRyh3PvR9bcQTmQx1xw6mTS0CaQTnI
	cJKEjAFCAlg4VD+kZYLORjgoyqUqiBxJQifzJJEjU/Uf3j8q3t5zRQhEc/3W4EaUV2yA8h
	s0wn9paFx2zXJGYluBeoGOXTI4cXNy8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-1NGBco4UO9aLCLHhr6vESA-1; Thu, 27 Jun 2024 03:41:21 -0400
X-MC-Unique: 1NGBco4UO9aLCLHhr6vESA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-424a775ee7fso13239245e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Jun 2024 00:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719474080; x=1720078880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDFpMT/o6TA3HhPIsNw7m21U54PqATB7NjiG2R0C4Rs=;
        b=Y+AszI44NECZBxixv0XTzdhQ7+SiCXf6t+jm1VI+RwNWfePlijCOM2eLyZ14Kv+jw3
         mxHYnlFSdtzE1LyBSechkmdAVqabnyRKj5zn/g8aClotQUwIokY6wFRxGItgDXitPvsO
         trpfORXS84a8vWvGUyA/Cn2KtACCJLcUENhzyfN5CUXR2vFbvHC8U3N6HTNbQTV0IQPK
         7wT0AqfU06P9wTmjCiAKD3Om1oyX9gxawF8e5DPFUZPrzlI7c/hlVyAzX0sX+PbB7QLF
         LFbrOBy+3SoJBktDzK0fM+ny+qq8wRpPe0wREAjHGv6SB2x93MzDYTzSrsy2nzyos9H+
         2oQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7t7k5y2yeTeRXHuHxLQXOYymecdQUx5a5PLxx+kcoseerh2krvWQW8CfusK2uU78gXUvcydVCCc1RQFLeP9keR/Rrv8bkTpjb34axNgg=
X-Gm-Message-State: AOJu0YxN80S2l5SvRZUvi+YgoPwcZo9LirTAclizcoJK8TD16gP5sVOr
	LvfhaqwVd+U98QuAbQ775VIGikos59GmDpuAX2Fodh4kWmA1ogQR0HluzHOQVZiigYWN8I5h4nN
	nMvF4tuxzP9U35EeG9IlpyjCksb2DLnKLZa/3YU5CTVN+58T2A7dq6fat48r11gLH
X-Received: by 2002:a05:600c:491d:b0:424:fb2f:9d4b with SMTP id 5b1f17b1804b1-424fb2f9f55mr25317135e9.21.1719474080106;
        Thu, 27 Jun 2024 00:41:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgu93kM3Jj8fkuZn8Yhi8DU/DjUZCFv12pgsTeo8oxcZqTXJeOuwx1mlw8cglG3sJJI8/+Lw==
X-Received: by 2002:a05:600c:491d:b0:424:fb2f:9d4b with SMTP id 5b1f17b1804b1-424fb2f9f55mr25317035e9.21.1719474079749;
        Thu, 27 Jun 2024 00:41:19 -0700 (PDT)
Received: from polis (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367436999e9sm970881f8f.76.2024.06.27.00.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:41:19 -0700 (PDT)
Date: Thu, 27 Jun 2024 09:41:17 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, bhelgaas@google.com, ojeda@kernel.org,
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, airlied@gmail.com,
	fujita.tomonori@gmail.com, lina@asahilina.net, pstanner@redhat.com,
	ajanulgu@redhat.com, lyude@redhat.com, robh@kernel.org,
	daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 01/10] rust: pass module name to `Module::init`
Message-ID: <Zn0XnbPKiarhyu3d@polis>
References: <20240618234025.15036-1-dakr@redhat.com>
 <20240618234025.15036-2-dakr@redhat.com>
 <2024062038-backroom-crunchy-d4c9@gregkh>
 <ZnRUXdMaFJydAn__@cassiopeiae>
 <2024062010-change-clubhouse-b16c@gregkh>
 <ZnSeAZu3IMA4fR8P@cassiopeiae>
 <5d7b22c7-de22-4a8c-a122-624afc3d12f1@redhat.com>
 <2024062732-correct-dwindling-b53c@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024062732-correct-dwindling-b53c@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 27, 2024 at 09:33:39AM +0200, Greg KH wrote:
> On Wed, Jun 26, 2024 at 12:29:01PM +0200, Danilo Krummrich wrote:
> > Hi Greg,
> > 
> > On 6/20/24 23:24, Danilo Krummrich wrote:
> > 
> > This is a polite reminder about the below discussion.
> 
> I know, it's on my TODO list, but I'm currently traveling for a
> conference and will not have time until next week to even consider
> looking at this...

Thanks, Greg, for letting me know. Let's continue this discussion next week
then.

I may send replies on all other mails of this series in order to not leave them
unreplied for too long, but as mentioned, let's get this thread discussed first
once you're able to get back to it.

Have a good trip!

- Danilo

> 
> greg k-h
> 

