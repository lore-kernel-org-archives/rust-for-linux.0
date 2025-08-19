Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052E3326D47
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 11:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604269; cv=none; b=IwsxS3kl5IKyC63sp16Y9kywGsWCkk1FUVL4PryYh88ce7YxtpUmlBusqodHMkhdyYeHQCZrmQmudslB+vrJ3ghje2561NHQK36NRidllEPQIMRQ73qvIDzuNb9RuCzQG78E4cCOE/rc9QKUFZYNYApqzQL82JTH3IjuJKIKkkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604269; c=relaxed/simple;
	bh=SfDdyjlluv0yY0VZ8kuECbGE7PSrMfznf9LOp7Vjx94=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d39AyJZvWeudULMv21ffKpWu4lsiHM+RAqRMYMk4rFznNcaydi4BJHmJFGalz4G+w+/K9Iiwji93rt4DUWSLjlIMcBIWWckBfpe/3e7xE+9MECWgA8GE0p+twYBp2+njL/jXu+JszmkYCSv61RNQhONL4h5GiHVigkSDHRqpTWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WHCmZAlr; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WHCmZAlr"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3b9dc5c2c7dso2853867f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 04:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755604266; x=1756209066; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XqVhSoJAwWQ9PlLC7tWLb3xzHxheK2QrN5GzzirIqUY=;
        b=WHCmZAlrGBjf0tf2YoNiCxiB/mcQfuuKg4YLEan1ryayZQYF4GlmIsIXubEXtCKMrV
         9LWhVH+BihfOgjCAcnx/RnViHRf6znODZzCDT2KF9eHjq7rf94Kof/Ycm1mdD7Q+aNUa
         PZ9vW0XGFucSCBa2lw1EWWb83ZSUw3IeMR6cnmrG6PbVEGN7DTbU7Z9NyhzoMeuxqJjZ
         6HopHxjmTH2ws5FYU6kOLSjvFjUun+KMBmyyJu3WuI2gTir20H4HIwC2lGRtpCDvQmM9
         I5qld7SUbB5QJlgEAWrO0zEkNeY9uwC2UDErJBYLz99gbcMiBeZc2Ct7VQ5Ijx6RIoEU
         0wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604266; x=1756209066;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqVhSoJAwWQ9PlLC7tWLb3xzHxheK2QrN5GzzirIqUY=;
        b=MokW177tAsEgjA+xYOZebPBaBCba7riMT0oLqDAYAcAtqziW8PlSTY5F9OPvMW2BQX
         Tyq9kWDsTT3/TrKtXeNZUEOZruj1EG7BfUpxcDykW8Kbn/Cl62UwNTW0JhzCqLsaUQsl
         2xg6+X2EEnI5Nt5RlRIZvx4N5sbhwnSE++FlnnnPPYPi+1sJTp0My6ajvXRcxLbKQIgj
         8Z+TfoPY9PI2vywCJMqJSh6PqrqH1f07nI1R1EOM+DzyVz7PiFVC0gxdnfoVHZ8g8ku0
         TVFmFK0VdXeN0ojQwSdlVlo9B4sbu7yipJF+RGH75EfODUFHmGEJUZh1kBf3sz54pJsB
         mZwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqQ8j+/AljZ5CcfLSixcEttd9pxObBB6TOrilYW21BUJaw/UqAINEsjziulp5i67KDyHdSe8lUBGY2rhKU0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqAkC8DJS2x2EsGu4jcnBQ1d3Wc2uvV8rJQYQyeYHZc/tWrRvQ
	o1Q1DZHhrf863UBaWRhZLtUIm9117PPHxH6V5sEikm2IxpTkBCQB1EQW4alRJRw/RSH0K1Omu5S
	x3tkzwiTl+xSPU0NGYQ==
X-Google-Smtp-Source: AGHT+IEP02KVT0HIELaiflNJvm9S4H5NPInQIDYzCdSqmY0+/ndVW3FnLNyjDTb08gA7GWX/CmGWsVZG9szhCGI=
X-Received: from wrsv12.prod.google.com ([2002:a5d:4a4c:0:b0:3bb:722c:f2e2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:402b:b0:3b7:8146:4640 with SMTP id ffacd0b85a97d-3c0ed6c4b68mr1987780f8f.56.1755604266349;
 Tue, 19 Aug 2025 04:51:06 -0700 (PDT)
Date: Tue, 19 Aug 2025 11:51:05 +0000
In-Reply-To: <20250814093427.19629-8-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250814093427.19629-1-dakr@kernel.org> <20250814093427.19629-8-dakr@kernel.org>
Message-ID: <aKRlKTLFjaRDZZZ9@google.com>
Subject: Re: [PATCH v4 7/7] rust: alloc: kvec: implement AsPageIter for VVec
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Aug 14, 2025 at 11:33:46AM +0200, Danilo Krummrich wrote:
> Implement AsPageIter for VVec; this allows to iterate and borrow the
> backing pages of a VVec. This, for instance, is useful in combination
> with VVec backing a scatterlist.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
