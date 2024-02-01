Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E376644360
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Feb 2024 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706799751; cv=none; b=B2XSx4hqzUSUmFycwx2uKRQKQFMjUlCgNrCZ4fGWuCcii6w+9i5qewpFUkC1KiVYZYCIo24Y0or0QHbsW1pFc+j7TSxY1CqbeW1f4kZhTF5hH8QgN1SqbJaBQBp2h9Y2M6zanNYHQ9CkY2PGysThyblmdOBRTDqItrW3RUNYdBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706799751; c=relaxed/simple;
	bh=PL2cwVz72BMPNvVOL9EUO/7qN8LDgW3309EkDFCnFhA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=VZAPg/2WZ5GlVe3Y1Fi9JaIRaWb0zd1qJT6MfUbkKD7sL8MeH3ZtKMlJPmj9vwxSbgRcle8jHaRwiWypesOWrdamgr1yT3PXzDF1Mu5MJJ3ECPGsjUoUi55yfWEoHVp6lPQqG9GOpCt3unX88kW2np4i4yOV1Ig8rf99VGXHaX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gI85SSqd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gI85SSqd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706799748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PL2cwVz72BMPNvVOL9EUO/7qN8LDgW3309EkDFCnFhA=;
	b=gI85SSqdvVQjOcFjbSKg2Qf8Q+68gTNVHFfQWwja/PaexRexNc4GnDCNd+GhPqpz8PaKYo
	D7INg4wUHI1IjCyWhiPlqcMHor6FX7zi0sF91IRTcQlXjL7OzCFxuUlVpVUbGEeyihZxzh
	/Pty/lETaMMQxd9YBe8LnXxSAeBxVNM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-Lsf3iKvOMhOtwPE1kHa7ig-1; Thu, 01 Feb 2024 10:02:24 -0500
X-MC-Unique: Lsf3iKvOMhOtwPE1kHa7ig-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a336006ef27so113094266b.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Feb 2024 07:02:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706799739; x=1707404539;
        h=content-transfer-encoding:organization:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PL2cwVz72BMPNvVOL9EUO/7qN8LDgW3309EkDFCnFhA=;
        b=BWANTBsl7/sOOiuuRJMY0WqNPKjkmazPqXh6JTg5EMI9VrmTDIm6xwHovjfJv8sE9S
         XQrecbZAcV0ZrAAs7MCzKr+iwKCCFwh0rDX4Bf8/3mEvsC2mSCch28xAFTnTSPHYBA9K
         IkXZrExo5lV5+i2uafs6DdPUVdVmGpV1rC1vH/aJbVmpkRdycPOsS6DwvfelQS5Kz9U3
         WosFi4qHqTjrZYXwUyYpWDElIEyvhsb0LzSvprYw/++Sr577ZXuSJkpfbscOLoLEc9z2
         tTS4JIphD3mj9X8rbirG1JgkZCPZlErk5tj+IP75UhkhVVkjmj/KmwafbYpmDGZoKHQ4
         /Nuw==
X-Gm-Message-State: AOJu0YxO5cVUWXXi0hTAdCiY2YmJ4FtK7lEHuSrCvWVzpE5n5UOVval3
	6Sqj69zQE/gUfL/TRXv5wLJIVrrJ2VdJiXYcP9Yu4u0qiWTJJu0OXnbB5dndM3xNCuE9JawtBg1
	n10s6NuSPnwgwomCrIYPMM+OZjUrZPw0Tv/+LG4rzTjYw49u/4DN7H+jBbFst4Pn9
X-Received: by 2002:a17:907:c289:b0:a36:5e92:b636 with SMTP id tk9-20020a170907c28900b00a365e92b636mr6174970ejc.30.1706799739452;
        Thu, 01 Feb 2024 07:02:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjY1tw1W00ArxI7gMtJjXQeesrXygDxkIQruA8Soni1MG8OhBNEZfgHIfaQKiYWGRXvaD+kQ==
X-Received: by 2002:a17:907:c289:b0:a36:5e92:b636 with SMTP id tk9-20020a170907c28900b00a365e92b636mr6174919ejc.30.1706799738824;
        Thu, 01 Feb 2024 07:02:18 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVzxI0n11QEtMMbjijIuIWc7e8p6UuwI7hbHLmYgl1Lk3pEDXgKR94WtbhaBgxtgWAhZdlNyhQbyuvkfz4M2ob3GYg4koxnrHFd6jfhhxrswXeX9DrVVktAO1lqlJuyJxdZSiAcII0=
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id o18-20020a1709061b1200b00a2e7d1b6042sm7239263ejg.196.2024.02.01.07.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 07:02:18 -0800 (PST)
Message-ID: <929f47e0-8aca-471d-b54f-26908321999b@redhat.com>
Date: Thu, 1 Feb 2024 16:02:17 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Miguel Ojeda <ojeda@kernel.org>, Andreas Hindborg <a.hindborg@samsung.com>
Cc: Philipp Stanner <pstanner@redhat.com>, rust-for-linux@vger.kernel.org
From: Danilo Krummrich <dakr@redhat.com>
Subject: RfL branch for PCI bindings
Organization: RedHat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andreas and Miguel,

I'd like to come back to our discussion from the last "Rust for DRM" meeting regarding a
common "rust-pci" branch.

As discussed, in the context of the Nova project we are interested in using those bindings,
contribute some more (also in the context of Philipp's recent PCI work) and help moving the
code upstream.

With Nova we should have a driver project which should justify further efforts to upstream
the code.

- Danilo

