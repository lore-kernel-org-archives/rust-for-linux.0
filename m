Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F4E1428A
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 09:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705569619; cv=none; b=Q3EqffQs7yd9UGqrIFVqsE7tgQowzVkQYQXbupkwoCdKX0U6TYd6XbNF1nRqnvNLsKNrw6/CEJp/ccUwgCulGQT7pC1j41YEOHXBJObIxxo96VT2EgAnpOd6ApOFC1klOpqgc41g+9sEWLJjK4wOBo0h/6brpXsmhbidekEemg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705569619; c=relaxed/simple;
	bh=6uJK8Rk93v+R2loFUMPdZpnKiQpND8O9ppCP8WuF3DY=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Received:
	 X-Google-Smtp-Source:X-Received:Received:Message-ID:Subject:From:
	 To:Cc:Date:User-Agent:MIME-Version:X-Mimecast-Spam-Score:
	 X-Mimecast-Originator:Content-Type:Content-Transfer-Encoding; b=iM3dpLWGasvq952w5WxWfiTQLBZCISiq06n9+MejHSaZo4CLwK+5ldNeD2R3BZPIACt6xeZpdBhBbItBR1JG2iiBTbwWTVMw9EBqCzCDwiJedPIIrl9MjrlQEwoAtlcrTkc1o5+NcAWrYA6faz0mLgq+i7D4PIo99Ey7hc1NjjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KZoVQapc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KZoVQapc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705569616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6uJK8Rk93v+R2loFUMPdZpnKiQpND8O9ppCP8WuF3DY=;
	b=KZoVQapcOUcT+qkcOYRJqGn7wTI0ZxYSDGS1+SCo8oZXUKqyFIG5vavDoYnZCcYUG9gZ7B
	Vsq5deNH9ZL6iKgzWjFeVaMmkD/J1bXwkVteLwq1M9bMlcwum53Tv462d12D8UtpMaXrfN
	Y7+oP9LjCFiXr8o7t5N+q5su89R02L4=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-NpSQQQx6N6qYA5JgpWpOrQ-1; Thu, 18 Jan 2024 04:20:15 -0500
X-MC-Unique: NpSQQQx6N6qYA5JgpWpOrQ-1
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-4670ca688easo1297897137.1
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 01:20:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705569614; x=1706174414;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uJK8Rk93v+R2loFUMPdZpnKiQpND8O9ppCP8WuF3DY=;
        b=gFo24oBxauqQga6NFjau51O33XOKvNLUA9azh1uEBcTxgfd0KbY+lvSxgEil0XfCHX
         5hFwLrCEzDqhhZNTbyV+0+MGYDWrIXbpoNQYjfS5CXpQt6g570Fsb+1+1YYQsW9L/AZn
         JUZzUigKUhMswPa5Yv3nbqxg+1BZSkkfz54wSRtVBv9ptbvA+aRtK8emKURx92qxchfQ
         QxP/q/qYZo8chGGjG9rNGVnrITkwZWDmN9pEtefryfK3WHFbLMa/fqJCVCsp5TvQKMEc
         g7PFc7BSsm4FDlfILUu2/uyvKhtMyPZfcXwdCCSu2hUpNpOO7FXKu0AGMk563K0eVMx9
         ahbQ==
X-Gm-Message-State: AOJu0YxAY59M0/AoAa0DjWLjo0wyQ4YOQBrPJoZf0i/pxlaTZ78Z21oH
	hy3GGZocFp7Vcu6MhRTQ+bzwKZR97AHtY1k1InXcD3Fz4cDilMjK6ZDOTfDZ9/OEyCsjdbk+iSs
	BWcPDoJQJgYz11b4sCyI4e0HJf/lOLzwM/zTotx0BhH1XfVVX/O3TdMk2IiHkAGiofPwIhLIJ25
	Bh6qCZM9PFoE9JjZEZXD2xIfKEFcvtrs2uAl7GgJGEG3s/nLAZ
X-Received: by 2002:a05:6102:3e22:b0:469:8a5e:2920 with SMTP id j34-20020a0561023e2200b004698a5e2920mr1032709vsv.2.1705569614466;
        Thu, 18 Jan 2024 01:20:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnjGzA2iCyIblWYWykCTYJ52gQzmmAHTResVOhnTJmUPTqNST0RcmNFjQwqJFHpaIX74JIYA==
X-Received: by 2002:a05:6102:3e22:b0:469:8a5e:2920 with SMTP id j34-20020a0561023e2200b004698a5e2920mr1032699vsv.2.1705569614203;
        Thu, 18 Jan 2024 01:20:14 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id g8-20020ac842c8000000b004283f2208e4sm6582943qtm.87.2024.01.18.01.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 01:20:13 -0800 (PST)
Message-ID: <241c57af61dc03c6f2f6bd90856908fcf84bb71a.camel@redhat.com>
Subject: Intended folder structure for subsystem bindings
From: Philipp Stanner <pstanner@redhat.com>
To: rust-for-linux@vger.kernel.org
Cc: dakr@redhat.com
Date: Thu, 18 Jan 2024 10:20:12 +0100
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm having a look into potentially creating bindings for the PCI
subsystem.

I was wondering what the Rust infrastructure people had in mind here.
Should there be one folder per subsystem in rust/bindings?

Thanks,
P.

