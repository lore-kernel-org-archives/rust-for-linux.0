Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B133C1990C7
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 08:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754642674; cv=none; b=iRFfpZKidnqDJxGrG27Pat3p4eAnn+8MRn5kXhODZuYHJR8EW0AYxNG1o/WwYUEY+++k3Xkp9EmbGKn37IsLrbtH/8nhv1++vEgSXHQgCtvgZW7oPJHYUPAqTzDFijBWu7dlB9yyiHmsNARtjrz/67BGv6H3NKwh9QTeOeWXed0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754642674; c=relaxed/simple;
	bh=6kHsowfXQ3yWpxKXharcqa9eMObQ486oQKpulEJSQa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+vagKx2uD8u2z9g6k9v4/C9xTxc2OAVmecxHly95G10Ren0s7c4fJ0N3XIcKxhTE97bYVD+EwZW4pDWfTUEVQjNiNH55i8DFIauogq+RnJE+2eihzRKeehn8LQ/TlnhXYr5NPIQcCvOTSh7k26ksicwKtnIREsfIf8aK/iWJAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGyIA1rZ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGyIA1rZ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55cb8ab1010so1667375e87.1
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Aug 2025 01:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754642671; x=1755247471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z9SBPDG0HenMB0UuRcGYp0eiaamHoxo3wkr2fPZP2aw=;
        b=QGyIA1rZMPfbdb933cS/O0VhpFEicbZv1AohsqQ3JMuoElG3j8hneYHp0X4E1zlxzU
         UtoDqtuHlKedUrTeAZS1ACHo2V44z76eAfXAHZTlwDm+414YVamyEN9VgSeHoo/5VFhO
         nMQbzFkHndzmu+YVG8NFnxtf7ZhlxXXqMtaM7s5vrmq5lnk5yk14byoeG0k/0Oxh+g6V
         nw//DuDZe7oMwAtHCyV0LUK9E+34yTaFjdOUhoZGGeZftEpMdURzKk/CoJXu8zQW9Jui
         nWcLQQEv6R87NjLeWME6P8dvJZzxtRqG6xggBnEHRsQgekuz/MATsvG0ti/zqcFHHIHH
         bUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642671; x=1755247471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z9SBPDG0HenMB0UuRcGYp0eiaamHoxo3wkr2fPZP2aw=;
        b=hiYwMRmj2JqLxtQIERQr/FKtl0Y8N6IJko/OZFS/x23AbwVjDi6aB3rqYIy+A1eOcm
         J4HuuWZLqld0Iuf/X827+oaMDPGsioRIJXh00mYAL5djJUUmnZc9iIxLk4bpt/f60udf
         uha5Kx3nTSPS012hxoiHElTkcI2j8XbXbkEJo3dUhtE9k6FBqtvmWQeChhLV9nYvfOdW
         5Xhmb21zoU6jfaEmb7yHs0wCebaqf3ZoNlDkHqyjeXGKsJNHPYLZOOVzIbplTnDo5Yq1
         Hri44Ov0NWWBZ9zaal61I3lnBn96Fj3MWLklKQZukPr9EuxDHGg6OBDffOGTU51iS3Wv
         KL9g==
X-Gm-Message-State: AOJu0Ywc//1YVSfEt/hyb4IIHQoznUU17kc3g4pv7HPNRnZk1XCi7yvV
	TE7aDy/zO7xdJk9uoNSHYPRCW7yssZ34HHlo+XD+JyJPwqwPDdkK5erq
X-Gm-Gg: ASbGncspgKA/+CG3n8RbargcaIysoq+vQ0G6R8d2hnnG+YvORiwGQID6QMFe5N+2dlW
	lSnbcQXSNvOVl6akHAvLg1DfHjPUcJ5wTRTKIgWpiFzt/6JwidUB5k4ARujvheHdEsUD7Cg9PwG
	e6ob9fYOeJ1IyYhj4Xg3PNXGPKgdjmutAVGKbfxgb0IERbejADkspVs3UqiK9E3E/P+Q8u2hE0j
	WuNRneeV4cR6xxzExgTBVR6qr3dOgjNA4rAGKh9HY4rRdRPdBIWhKQ2ekIvF8U+VyfO9K4hhDU4
	7rM0cjDp2V9VzzTxUt1Czp704gMdqoQ1DOp+go78tPPyS0NSA9licsDPrhh+JiXUIV/WZJfk+Ov
	BJutFft9F/4+b3D/Czshm6Y3jaR6phGRiRNU3vy15SZO9hJvZak50r7vAelTJ3IxD0w5IiFSTM7
	4=
X-Google-Smtp-Source: AGHT+IE0XsV72yDL6iv/uTZuezMNUQfQC9nerNIGq0iWk/vSAaUanBaS96yUVe7i48FioQhjV4jZ3Q==
X-Received: by 2002:a05:6512:12ce:b0:55b:858e:b60b with SMTP id 2adb3069b0e04-55cc00e3342mr534422e87.17.1754642670820;
        Fri, 08 Aug 2025 01:44:30 -0700 (PDT)
Received: from [192.168.1.146] (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b9dcac8aasm1964743e87.59.2025.08.08.01.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 01:44:30 -0700 (PDT)
Message-ID: <75edcdcf-19c1-4d4b-8123-f131ee2e3980@gmail.com>
Date: Fri, 8 Aug 2025 11:44:29 +0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] rust: alloc: kbox: implement PageOwner for VBox
To: Danilo Krummrich <dakr@kernel.org>, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, Liam.Howlett@oracle.com, urezki@gmail.com, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, acourbot@nvidia.com
Cc: rust-for-linux@vger.kernel.org
References: <20250806205044.85085-1-dakr@kernel.org>
 <20250806205044.85085-6-dakr@kernel.org>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <20250806205044.85085-6-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/08/2025 23:50, Danilo Krummrich wrote:
> Implement the PageOwner trait for VBox; it allows to iterate and borrow
> the backing pages of a VBox. This, for instance, is useful in
> combination with VBox backing a scatterlist.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---

Reviewed-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
