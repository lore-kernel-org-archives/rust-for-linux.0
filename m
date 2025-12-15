Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D047033890D
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 16:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765817354; cv=none; b=UJZe/Rh9pu3Bc8xmBUWWahxE9n1OdF6rV3koDlFnbTIJKECF6si8ZyiviiN6fGo2r+VdTPDv07heAKvhsryjNqsVRw4zGUqDJM/cA70ghVR07m2Wn1rhOnhVlfiEAxXHCixe8TD+h0GjKk8OftEdvQVUqmSCI6M4WvZgTMyVWsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765817354; c=relaxed/simple;
	bh=90eSrAVeTQt1LSlA7rLADIe1RjnPjiLd7YkjkzDUFBU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ty9AWE+kuVD5CONsk6V2d3zzv9c9TO2h3dGtdjXD1QfPBz1aFQSHvCwZTWxr8eJRTmM5H7yEbUSe0+ZvQJ3DZsO6DJyrwvdU/xyJMj2tbvakeR5JdsZZzTOhwwVOJlYkMb1wCvlN3by9H5muvmvKG5LVpMPyisVojvS4Izsa9WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=auD15zC/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="auD15zC/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765817351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90eSrAVeTQt1LSlA7rLADIe1RjnPjiLd7YkjkzDUFBU=;
	b=auD15zC/OQRs2EhXaKmG44svFCYm2LWDnv7G2HY1d/LDuPIkE+3f+sJpoZFhCdl0/lgm+z
	ey9gN3bcg0rV3rAT+fTtJT5t0vSY05KjSuucHzEQuKKbfoIcIel4zRBrKT43I0w0Pgr9/L
	IOFIfmFFiWvdm+CkaB4PyfhSfz/7Jys=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-5DafO69VO8u1LZ04zuzkpQ-1; Mon, 15 Dec 2025 11:49:10 -0500
X-MC-Unique: 5DafO69VO8u1LZ04zuzkpQ-1
X-Mimecast-MFC-AGG-ID: 5DafO69VO8u1LZ04zuzkpQ_1765817349
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-be8c77ecc63so5821221a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 08:49:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765817349; x=1766422149;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=90eSrAVeTQt1LSlA7rLADIe1RjnPjiLd7YkjkzDUFBU=;
        b=uyWMfN5uVHgcN59T1aV1+M2uxVU4G79FsZT4xcKRL5lKuTQJoSsX7SpuG8oZQVIde7
         2fpoMQ2r/0Eoqc2K0No8sj4+G8yUn3sNiOepJIayGg+tMyIQKSx8/6tMb4/B8HjVJ+7h
         BYR5BIECKm6wiyOHocbgsBbUhFcbKFMbdI+Cbeum7tlUffdoISFIUe2zI1TijIpOwDzQ
         8s35Mape5Ny46lXz9bcAGt+yC/w3FNVFqsDc8l772d3Nal31YUHZ6WvDa7gJd+pZEi6b
         Dq6YnYTUx2MfIJqtkGrWHoOQlTU1YyLH8y96tmoXFvcU5CT/ZdktBVpnpHGqZL4dusd4
         +QcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxX+wBmAZYKH1i+F/lQW2zmHLX6qr1gJTi+2wGXQqV6UzAr486lKz5EgUZpvciurgBMt5I74xnsTKjnbt4dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyG1ee5Y/yFhl4QRoR7cSbeDiUz4j7b392b2ZnOZICeSvd34qxf
	PYJsflIMnNpeBaGi8etCw85u+EyCCnopSkkSVhSf7WDrxzhRl22W7s5Fk7uGT4LJCvOmDHslwOy
	wXqpoDRB3LFcquqmGR/7hzxt1ug32AAV4P1cV9TWyoB21hzBXD1N9rXFJwd22qC08YHU2
X-Gm-Gg: AY/fxX7jmgiRYxDMgHjnz7lIla5GR2MjtitVal9pDVER9gbIlzRS4P7lz7naOLwyFF/
	eASF0p5N2GG4RbMv6MYSql3HIObI1VdIljIqtN3EcY2aX63VdHB1wZQrhC0ymv96JFwAXXKpMfx
	h/1YkAnYoNzOkYZHAExxYYSPzVHJaTXRkwuIEgDXnHbq780lRgrXjmc08nX+oHNk7MmY3ryVYE3
	rBtcn31qwiJk3RHq89KQNnn/hHmqlIU4he2Hjq10zCCLT5z11dUxYaV3ghrqQvUXk2ZKfaGWGXL
	KTRWCDmmkPGNMCN21X6cnuNMKkXFECMhyOI1Ku8y58o3tcEAbXHpxIJwytU8SwVWzVYx0kyKxL5
	sy9L1DrTO4+YanYfVdsXhqPNsz3pM3u9Vt4wgZKprjpG5WuegEBRMbMhm+s9+
X-Received: by 2002:a05:7300:c8c6:b0:2a4:3593:c7d3 with SMTP id 5a478bee46e88-2ac2f8e6567mr7849994eec.19.1765817348895;
        Mon, 15 Dec 2025 08:49:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9ywBhO+AjyorN/QYLDdR6ZuyZ8MLKsTGfFQn8LxsH9eQGPESUJaMLsKCapR70wm46Nx0uBg==
X-Received: by 2002:a05:7300:c8c6:b0:2a4:3593:c7d3 with SMTP id 5a478bee46e88-2ac2f8e6567mr7849968eec.19.1765817348330;
        Mon, 15 Dec 2025 08:49:08 -0800 (PST)
Received: from [192.168.8.4] (static-96-233-112-129.bstnma.ftas.verizon.net. [96.233.112.129])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ad44110517sm15225311eec.5.2025.12.15.08.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:49:07 -0800 (PST)
Message-ID: <f0ad76f8e6e044f56f86d39718843f838b5a8be1.camel@redhat.com>
Subject: Re: [PATCH 1/7] rust: pci: add PCI device name method
From: lyude@redhat.com
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
 <jhubbard@nvidia.com>, joelagnelf@nvidia.com, 
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Date: Mon, 15 Dec 2025 11:49:03 -0500
In-Reply-To: <20251212204952.3690244-2-ttabi@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
	 <20251212204952.3690244-2-ttabi@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TJ8E2KMYslKyf19AvT2wyiETxrpqdYQ0P9yg6OSAotY_1765817349
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2025-12-12 at 14:49 -0600, Timur Tabi wrote:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // `struct pci_dev`, which co=
ntains a `struct device dev`
> member.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let p=
ci_dev =3D self.as_raw();
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let d=
ev =3D addr_of_mut!((*pci_dev).dev);
> +

JFYI - addr_of!/addr_of_mut! shouldn't be used in new code, we're
moving to using &raw const and &raw mut respectively (which pretty much
do the same thing without a macro).

