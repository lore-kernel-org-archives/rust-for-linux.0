Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCF4341AA4
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706428; cv=none; b=iPyETuIX0VdS+GteZ9IxVSIIGmxepCUOCvybTmsTyUQA+Huxv1Tg0P0JEngYsYM9iok8s5+eM4Lnz2RNRR9gmhYSL3f2wL21aHhIepofSiLvy+dlHLOsePVRkNg/xPCVuvscbfYwUpW3NKjgLAIu75ZiX4LLESheLgViWa11Ybc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706428; c=relaxed/simple;
	bh=UlQGl1ScHrpEQGlp5xSK5Wvs9cVhOgIQeIG0lXECHuE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WB0Wl4pxtkYB44iWOmanp73uIyMqbyPOizgBzvHHhc2pp1W7I0D8+KR5rJuXEP+RpR2a1TLnNpX9SJu43sghYuPZv+lefqkdmZLlCCBfEchF545YYTqyZ33H7qvJZzxdMMdSqaAQ5vFg2TfRTeqpOc7bic+xDnUmWw77Zd9YlTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rxi4ooY2; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rxi4ooY2"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47107fcb257so23122545e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 06:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760706424; x=1761311224; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SprhfwBgGE9ehANfWOlvkOyYRUmTibUC89wBbYn2ZxQ=;
        b=rxi4ooY2VnUZVLeGuj0o6SHSSCt2DpRWnCd/2jZq265h6o/fLCPkLTd4dMEFx9Hu8Z
         di0WhFwBKOoexJx7t38LAdOl7OD9rnnrFl2x/zYwhpfML25AoHz5n0wz/lh7Zv8WadT1
         /F8Ns0/bCgfxoj5k+UzeLSe9h8mV2g7Ls8rvXf5XJjVse2HV3sNoEG8RRDfbXf6SprWw
         seeTbRocclwwPcDn59/+y25+pkAaD0Cl142bp/LXWQ6atiA4g37/UuOuaNdCBWoZRZuq
         tXx7e4hY5gtfp64BqJn8vcAEUxIaeKVKczbLOr6rg/66+XYyPE8cO86urTOoAeqWEmOF
         iVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706424; x=1761311224;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SprhfwBgGE9ehANfWOlvkOyYRUmTibUC89wBbYn2ZxQ=;
        b=slDACFA/91lrZvqMUkxj6dtFRiuq8BIkvf+p2lxt1OO+9ewIzKGLtC8yc/d/JhBk/k
         UjS1KJcWxobXQw/exEra7CrmwTpTe6X5uAclZT5qLQgNHpElKPR8hYqBvuflbYMQbUTo
         ZN9793nzf/uVpDfR8DMStyqivPHmlWbmFbnmPCpAEaIYyWpGIfRl5KA/8Tifq3E0FLfk
         ly6rleIZiVYY1Do8deXF6a6xLjdp4Z3FE4/cpQeKlwkvfDnDhYvGkyvvuZax2P4vlloO
         DEUfFtFlXOyhORQyyMCS46hBuGA5o7WDFAJ624iJDJGMaTnBqWKtRNbuhM9aMlX5c8H1
         12Jw==
X-Forwarded-Encrypted: i=1; AJvYcCV30J2ESiMUnepKOObvDl6VvvJ/+jVJVFLhDoRNqAlGbmMh/kOMsxZk9jYTYfCYCPtCK2nWSa4Lk2Y0skzDnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyakFHHSOtW/q8g6iH514zAjCwIcbP9lJPKwWTnxXgTG4G/Cy5
	bOCST9UG8omoMMKIYw/9+IycqELsjdwQPbM9CiSeVtfPvH03h1DKwWSGfpJdIoWHM2aeMCKriYA
	aTVPrGrgVwIFyRMNm3w==
X-Google-Smtp-Source: AGHT+IFC7yLsEvAPHfk7qNsNSq+04mGav0QhCDYZxT1xGf6tqBnc3CGyTXJOJDKdS84LHon9JPZg9QkSAmeZDCw=
X-Received: from wmoo1.prod.google.com ([2002:a05:600d:101:b0:45d:e2f3:c626])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:821a:b0:46f:b42e:e3a0 with SMTP id 5b1f17b1804b1-4711791dc89mr24693625e9.41.1760706424497;
 Fri, 17 Oct 2025 06:07:04 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:07:03 +0000
In-Reply-To: <20251016133251.31018-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251016133251.31018-1-dakr@kernel.org>
Message-ID: <aPI_d5Tzk2fZLMPg@google.com>
Subject: Re: [PATCH] rust: device: fix device context of Device::parent()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, david.m.ertman@intel.com, 
	ira.weiny@intel.com, leon@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Oct 16, 2025 at 03:31:44PM +0200, Danilo Krummrich wrote:
> Regardless of the DeviceContext of a device, we can't give any
> guarantees about the DeviceContext of its parent device.
> 
> This is very subtle, since it's only caused by a simple typo, i.e.
> 
> 	 Self::from_raw(parent)
> 
> which preserves the DeviceContext in this case, vs.
> 
> 	 Device::from_raw(parent)
> 
> which discards the DeviceContext.
> 
> (I should have noticed it doing the correct thing in auxiliary::Device
> subsequently, but somehow missed it.)
> 
> Hence, fix both Device::parent() and auxiliary::Device::parent().
> 
> Cc: stable@vger.kernel.org
> Fixes: a4c9f71e3440 ("rust: device: implement Device::parent()")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
