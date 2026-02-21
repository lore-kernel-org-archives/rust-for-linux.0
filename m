Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36D611CBA
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771664469; cv=none; b=mHIv9REoYPFKOtN9ACpKKICmUrdBJ9O7wzrXlUHW0clRh2CRcyyd5h1G02mLm5PoV+aLudMdQlA+vHNm/S6T5WRI+dOtpKauosFPi5fIXt+hodP/SgFWJdAhxAfk2SiiZIuElIKaH+8ayg44qIxLZyNAbUWLwKwOK4Lq6C7BFeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771664469; c=relaxed/simple;
	bh=foP9Zs+xFWULpW25QMB1JN3468oIPdNroHO//NFSr8c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m+oXY9k31qtjqbjcabDcFc5/9rK2M2RCpBvEkmuPz/TQloO8RyVGvw/JdzWs7nkVziNrjDZa3atNsUJkzA7AtqWqWFDuYoEkUMhn8SCeuDCiLr5Ql7Qp8gkGmvgSM+va7vwwtPKVH+lUFUDjii+F3TXp0lJUgx+5u+v1PqfGr3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pi7GUDTf; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pi7GUDTf"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837b9913c9so32002345e9.0
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 01:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771664466; x=1772269266; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CDxg5/Q1IAt1VWYUZzRTRQkuZmjdGOa1HbUsVbaTc1M=;
        b=pi7GUDTf3RvVVPqjfNwELhlI3p/FA7txeC2Jjy9PmCNll5UDvjNJLKmm2d4baYd3fs
         o+MQHfS85/oMBFe5x+MBFO7Q46C0olvOP1IwepLXIfCwVFRcQJVUnBKRIJX9L9Lc4shx
         mz1arQJ2mTpWg3s84gTaLW8xXivX4lS7+fvEq3EV9l2FaCQX05sLgyzhkEfkfKVBvP/4
         zofX5Kn9x4CuRFotMBhbR49NofEmVG4RZnZ6fqs1HPvTcJEi+AvPNBRJ1zQU8dhMdtUs
         xufJ6HVaTihRpb9a1R5H8VInhTw9VEa4jQmLfIUFc4+bnyDZ3qPvU5x2W4T97R+KMYGw
         KSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771664466; x=1772269266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CDxg5/Q1IAt1VWYUZzRTRQkuZmjdGOa1HbUsVbaTc1M=;
        b=H4S/ir34udFwUtvQ7efPhdC/lORjG/VuM+plTGIcFeokf5WFW8TMa6JeSpEPbuL3VC
         NoGjb97Y4LU+ik7Mgw5jtrmolGb7AYJZLQAvOVOreo3m6H4EaIlPdKicIJSILxUE2dRL
         QZG1kswgUy9kWiWhPlAQ5F3jpURgQhRaqAiv37S3mmbGFAUxmF12AtLBPNNDjCkc/344
         X/E/E7oBBj1bWP5u/1uUnPEWumbdhCOzSTsrHVSPrEug7X5BRAZX9vHhcweLNl3lGJXZ
         dIAGa8zHiswQLa4L/UCkY1/5qsXOInBPtd7HoUDb+r1im35MY/Q6lwPKp2J4KUVClYJ7
         bnkw==
X-Forwarded-Encrypted: i=1; AJvYcCXkmHw+5g/9xxdm336lh7hKJJbKEPD3pWjgAIfIkH+9FEt7K6tvTSmSoj5I9Pc2GAMIuHITMV1nUFz6nbFaIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQL4XToA3I2O2fWrjH6kdb2rV68PO8ZGZ6JJmbGcz9kNVs3GHE
	D77ifCpOA6/izJmP3dS4vT/S1bJLsYwDwdVz/xfjY+Sd+Tm7x2YmhwYSRjcu7dopZrT//Sz1rTE
	47+8w6KQb6yi7+FSD5Q==
X-Received: from wmqt10.prod.google.com ([2002:a05:600c:198a:b0:47e:e27f:e298])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8206:b0:483:75f1:54f with SMTP id 5b1f17b1804b1-483a95f8a84mr41710485e9.31.1771664466113;
 Sat, 21 Feb 2026 01:01:06 -0800 (PST)
Date: Sat, 21 Feb 2026 09:01:05 +0000
In-Reply-To: <20260212013713.304343-3-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260212013713.304343-1-deborah.brouwer@collabora.com> <20260212013713.304343-3-deborah.brouwer@collabora.com>
Message-ID: <aZl0UXJ4agEpsRBj@google.com>
Subject: Re: [PATCH 02/12] drm/tyr: move clock cleanup into Clocks Drop impl
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
	beata.michalska@arm.com, lyude@redhat.com
Content-Type: text/plain; charset="utf-8"

On Wed, Feb 11, 2026 at 05:37:03PM -0800, Deborah Brouwer wrote:
> Currently Tyr disables its clocks from TyrDrmDeviceData::drop(), which
> causes them to be shut down before any other fields in TyrDrmDeviceData
> are dropped. This prevents us from using the clocks when dropping the
> other fields in TyrDrmDeviceData.
> 
> In order to better control when the clocks are dropped, move this cleanup
> logic into a Drop implementation on the Clocks struct itself.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

I agree with Boris's point about pinning.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

