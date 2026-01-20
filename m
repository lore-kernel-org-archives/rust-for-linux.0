Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF5C3B5312
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768896388; cv=none; b=mNKcfJbnk8Fa6bb/elhelJZj9x5537VnofupZfm3oV3OBgz5cLMF6Ad38TrFnJN08DFQzcKAUaMVCAkH7Oqi1lbbBdw9t6aqVak39uuklEs2UPfxPRi9OhtDfeb2At3BiUI36rO91DQoKuLDYHmW2lsZHvxS/78r6SZmCV+UFZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768896388; c=relaxed/simple;
	bh=RisvMMfDBwsWvMB1G4b25i09gBXscNBQHsWWByJ/WBA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V9FJ8hNlSxbHUO0ycKlkn2O1I104n6X7uCVmsFyInrnCKp0l9rJiUum1Fw9zhCwzyjY2gA2auQ40ZgwMI2vbYrMwrw+hw1+qMx86Eh20Wi4P2B2AuS1Upbs/rsJhBXjimd00d7Uq5AZDbwI0qSuiyoGaHG7Ue+CM2E+znkAYbe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=upw6bnRc; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="upw6bnRc"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b871328f6caso468335866b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 00:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768896385; x=1769501185; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZyVSgGKZ7rE7RwBbuAawYyoDPy1ltMaT3wd65JIxCU=;
        b=upw6bnRc8F9yvvqEjKNTQPy3c1Ul2rJ9lfQuXbsyn66FXZ0zjU+ntcnyaCQsVn72/N
         luLhOAp+yLFHdNymjEjG+zE0H6sn4/KZUGGgdlrVbeL4tpicy2nzfP3wCMg7dzN6w3hQ
         Y3bsCb0ibSsw0Pkh94WMqBriTgMyImW7yTUL8RDCbUk9/xovtF8FhZ34uge2H/JGM1cG
         yatp6rh/Ewf5UZ3uckrrrJfEsK0uzr/3+bAtCgL+ZUtlwnPKnW/kaGtDuJBOQWgY3Hds
         9pPzDAz2pSGLYYmicgHX2Tq6Gb4XgDHi7dEvroUmfu6xH0V+aYY8VDvonu4nPMZe1XMm
         V8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768896385; x=1769501185;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZyVSgGKZ7rE7RwBbuAawYyoDPy1ltMaT3wd65JIxCU=;
        b=FV3MgTxWTp1qUgZ4Zk68wfcgAaJc8KB7Gn/f65rz4qgCGuEgYj6k28ohMe+SWTFOAM
         pLBM2FEqtLndWNrak4feBYxMzskSO54O9sYyWFJYuQ7ePbTaHpH3X0tjAIc6K/9jyqHP
         Ckf2Y7XfC/CLYAT59Bn1AbKscv7pwXrdwXhw63MMJOKM79uO22W1E41ykzFs3FbIoZQ3
         lOhr/JBbSGO92UXwS9heU/Cyf91yhFabeLxBXcWn/yWMeGaxZfQN4KNQ2VN/8TvG2o0+
         cQnZ67cPIIMiHLR8T+xv0QORkDkj2+v6ZzguK6BJAkZPbBvDUf49cmf2LyLDSt2F4a9h
         Dlgw==
X-Forwarded-Encrypted: i=1; AJvYcCWsIINL+MCcdubXKitH/kng86M/2Dzdh5NAcW/o8NY/UnhVcZ+HSeIghOuOPQ8FuuVD6Q3o+fwz7A57fOOWfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz45/CV/fUtgyt47OxEaXh8VQs/8FoAfsxbLQ7qjVYBK8v0Q1gd
	tuLPhsC01WRS0t9mmapJhWCdmsdb/Ikw7E3Kin9alMOK/FKxcR9ELDNthZW56V8X9FC2YyWdZNg
	QeRmXTSzM+Vgy9S9qDA==
X-Received: from edy14-n1.prod.google.com ([2002:a05:6402:534e:10b0:658:775:9fc4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:13d4:b0:640:ebe3:dd55 with SMTP id 4fb4d7f45d1cf-657ff298c99mr895307a12.6.1768896385388;
 Tue, 20 Jan 2026 00:06:25 -0800 (PST)
Date: Tue, 20 Jan 2026 08:06:24 +0000
In-Reply-To: <20260119202645.362457-1-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260119202645.362457-1-deborah.brouwer@collabora.com>
Message-ID: <aW83gHux1JSYWPdz@google.com>
Subject: Re: [PATCH v2] drm/tyr: use read_poll_timeout
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com, gary@garyguo.net
Content-Type: text/plain; charset="utf-8"

On Mon, Jan 19, 2026 at 12:26:45PM -0800, Deborah Brouwer wrote:
> The L2 power-on sequence and soft reset in Tyr previously relied on fixed
> sleeps followed by a single register check, since polling helpers were not
> available in Rust at the time.
> 
> Now that read_poll_timeout() is available, poll the relevant registers
> until the hardware reports readiness or a timeout is reached.
> 
> This avoids unnecessary delays on start-up.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Overall looks good to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

