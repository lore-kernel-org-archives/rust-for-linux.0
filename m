Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5F73624DC
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477898; cv=none; b=rj+OwoWMyvHWzjO8HthuDOT+7SpgAiya4cu8/aYjIOdwgMm6G6s2kmzPV7yhW24245BAKER6ciD+3RL3Y+k9Qsx5SNpYtv45qYh72ow3jt3BgyJrUMjOHYDyS7P8Oc5zSlUyp1+PiEKgzPkzD/LnVAK6NVPRs+VkZyLWYvJ0bm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477898; c=relaxed/simple;
	bh=DPfztGpTpKeZwjuO3Y+4RpBkmoIsNivSOXSgBqsyN+0=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=LPAxwS4LNdTk7wPNYQ3yLGOBYaa4E3ad7DipMtbRMmLqvJ38cYR+3+AcbnUvomANq02+jb2tHDmk3JCso8nq+EJW2Fj14q5nHBJGHSOCXq+rqFg0NUdGSE70mRQEEzOMh3G+7lx+h6N1dJQ9p+FVj9lUX8cR3caNdA95eQo8AZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XQEC+Wz8; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XQEC+Wz8"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47106720618so65640815e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 06:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763477895; x=1764082695; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DPfztGpTpKeZwjuO3Y+4RpBkmoIsNivSOXSgBqsyN+0=;
        b=XQEC+Wz8UIXoObeaMiJGlUUUvDcb4FseZK2UuMU8au9M843kYGS99h2eHb9yefkI+P
         wEE6MVpKzjYgFqcMpCcfoiiyNYerIEo0Y1TRup9+CVafJC68DgHSprzpjf0NjRyXW8jB
         r2GZdJU3mrSdmtg4JhcZ3QUNo3FvqoCxo3cr26bkKbMNos2SuJW67yIH6CfTXC5lv3fS
         86LRppOz2ExLpinT25jF7jshe6nQD7d018Vy394BS7/xOt5h6WwoNEkltX/ROiCcEFAg
         fo7BwCW370UituEtDTfejknVT9BzC4Jls4stUCZ2O3xfUzyo70A7rzcmtaCXAmSYLUru
         wT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763477895; x=1764082695;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DPfztGpTpKeZwjuO3Y+4RpBkmoIsNivSOXSgBqsyN+0=;
        b=E8dPdLacEEcTmaXsEIMBU3JKJVJ7HqlAbo/qoyfzBRjc66NJQsKgz3RyD4pvmSbhIC
         Xe5Bq3hir07L2cmXMDQkcQx4NW3uYlGzBAF8k4/XTSikvKFNlH6fZNQa3ygaZLL9BcVI
         Qwe32xG30CbbfvQu3pLkWzSuJRGOow84nChjyiUZtTPViAPyWjspVbYyNJTHIHI/EDSm
         bLkUuB842jaABRvHGOKKlQDRjJE1dcnGz5ruN/oUR+mUh6Us1OOIa/ROSQ2Arh+eRHyh
         GBU4XZLicSWfFTtaWh2lsiO+BoB0Igya2YYZrj3mnJLQAjxfR398kbZa5BL5d30mfrxd
         VKvw==
X-Forwarded-Encrypted: i=1; AJvYcCWSYoLq+RDfaGx+kuKHLwoCXCljBaudx1ypZrbQsxAFV2DjoBug9/7Jq+UDoq5L/dpbQACIKN5cgkpPFv28uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNc9t629Q31R0I/hprJd93dz/bO61GNLXfkCK3/PZV/e0mDz9n
	PbPDDBInTv/ZQnp8pXTzwoMauLYTZj9O96LHhpyN8Hy5L1McpfI2gIVdLmgB+kym74Qk2F4eeTy
	k01uDJiTapneDCw==
X-Google-Smtp-Source: AGHT+IF5IuKqsfo4fGvtEqK6+inM6Wme3e1NzVR1nM/R1oTA+LPa6JsLnhIYst5T5QUx9HKDMNad3Q0W0SjPeQ==
X-Received: from wmpl35.prod.google.com ([2002:a05:600c:8a3:b0:475:d8de:fe5b])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a07:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-4778fe55101mr148495515e9.4.1763477894678;
 Tue, 18 Nov 2025 06:58:14 -0800 (PST)
Date: Tue, 18 Nov 2025 14:57:36 +0000
In-Reply-To: <20251110131913.1789896-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251118145741.1042013-1-gprocida@google.com>
Subject: Re: [PATCH v2] gendwarfksyms: Skip files with no exports
From: Giuliano Procida <gprocida@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>
Content-Type: text/plain; charset="UTF-8"

Hi.

> Thus do the last one: don't attempt to process files if we have no symbol
> versions to calculate.

This results in the -T foo option being ignored in the case there were
no symbols. I think it would be better, consistent with the
documentation and expectations, for the file to be produced empty.

This means that just the for loop should be skipped, say by adding the
condition there with &&.

If you disagree, then please update the documentation to match the new
behaviour.

Regards,
Giuliano.
