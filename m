Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF412557A
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Oct 2025 04:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760849975; cv=none; b=sQ5vZYAZgWQc3S5fUhVXmrDnLiIJ3fc7pNHrR0au46mt3RwQDHQNdY5Wad8TktsfG9H3wthDw+FZyrA1rYYK84sGmZHCm2nSs4xGSaXOsWwQat8hQcbj8x+1P+uFAby3DehkrOjCsm5ytIKU7qKkx/VTQYVp8SNTpnIgzuwasCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760849975; c=relaxed/simple;
	bh=Ji9lq+aNwm6hbpBt5h92c/WN0f79IQ5SjMVzwETCTD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=CrsoGKKxwJtueujV+9mwPh/0t/TSREyJ1WXy8yhotTa6K+3Whd6hZ4psRMQXU0HoTr4cIqVe7amHIwJFxkgfqNOiuo0lYcjW8WkBZkuC5rFPM0megzq3iywhGNZ4ojdo9p9+WM44sV/qL8A0ETkHKHHux6U/10ODtojZgcyusu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ibNobdu1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ibNobdu1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760849973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4Rg5wTZhyWXAF3O1WtCbMwsNNr56nuunOEL5hac1nco=;
	b=ibNobdu1pjE751Kuo3ic2tqpjaAOOpH80aVD5tgaUjnTREBGdnQGr3Gshc0dG2YjZsmDG3
	VPnh9FJr/pKLIFM4ailli3VJCueqPIKjm2+63K7OKAeqCW4msjombnHe3eyHWAoCaADxhV
	FkOloJmf3/IjrM1EvmgrXeWDzA459i8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-9YbKPR4xOlWKMm40fzeZTQ-1; Sun, 19 Oct 2025 00:59:31 -0400
X-MC-Unique: 9YbKPR4xOlWKMm40fzeZTQ-1
X-Mimecast-MFC-AGG-ID: 9YbKPR4xOlWKMm40fzeZTQ_1760849971
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87c1ed305b4so91542756d6.2
        for <rust-for-linux@vger.kernel.org>; Sat, 18 Oct 2025 21:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760849971; x=1761454771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Rg5wTZhyWXAF3O1WtCbMwsNNr56nuunOEL5hac1nco=;
        b=IXI0Vb2lT51cSswgdL3c0pCZtTThHPKIJWK8uBNX4ZwnVTU46xClbPPvKQKCz1i+xI
         I8kng6p4OEBqDbwnrwQVbtBzLKlbrrexP/vUqXewylA2/CRC/2A1FwK7PA+mmpkfOYYa
         4l6X/42i2B6+z3YGnvQJtri/990zh68Lp3hdakv5basBTpTKRwyhM5r3/Mvl7gxcZMmY
         7QwLzDUenPvNmw/bu+l/+m409hzzRezeBhnn670wf/nlS+3HPdEukU2NfJc9cKznhvvJ
         9MZpnq56hw5rP8iBujJwLv8YPG+w6o18YMZki9KgmeVOY4hfU6QKhItzijNwIoD1TCbc
         Ycqw==
X-Forwarded-Encrypted: i=1; AJvYcCVKTR7Rfwy4/IzLQW6gR4ePOgyzy0inCddZIJcwhxbcHUoY5BVHCxpnzhEIgBuWCoB9+JzAkXFjEnXyAPZTeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm2PzMyS62tEh4ZsQdaH0Fic0W1gUU9GcI2ukwF8h8x0LmHLfl
	+JVlMfX77eBPA/oe+agYUry+AioafXAsFlsDGBSf8TIJgKdCoIMXbLyh0TBk7j9nx6AXNbXYI5b
	Eey6k3KZ7KnGTJdWSGlFOlDv5EJofxU0wo3w1efnthVbKlt0sDHcWoMkMdDsE/EEER9nJ
X-Gm-Gg: ASbGncvlu8moQGsFl7fCBvD/lsIn+5B0YEWOprMT5vIoA17akn8mFk48bJwklG4O0Wm
	OJ0s/nUizFYNwcRxO/cUNmXzlAtEkZpHOGH6v9qZphRnczfXxTVv1LwH2S6g20ZW9TM9SkyDflD
	pIUpYfOBhlv1YfV3zuly4xYhOchSLZsPt9Wz8PyNV5azBvTKllJTi+wUEi8KbjhhzfCbvRciQNV
	m+1yKgQ2cU+x1zo4d86qoVO8N8X1UO/vywfrNp2hceS8PqHPPmKTNNqQ+iYiFFCCprZypR5s7rc
	doEBwD1xMQTIKvmUFJughOXhJUaALXlisegkQzys8IFYToIuJAbo0keiZJL1IE0t5+T1erWv1/A
	q7vEm0dosRL6Y
X-Received: by 2002:a05:6214:246a:b0:87d:cb55:823b with SMTP id 6a1803df08f44-87dcb558259mr36428456d6.51.1760849971357;
        Sat, 18 Oct 2025 21:59:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ0WYFs94koeYN9P9Lx60CmnPlOsYnsSjjwW8eWntBAW+OKyfBWDFQcDFBfZw6XpdAUPZJUw==
X-Received: by 2002:a05:6214:246a:b0:87d:cb55:823b with SMTP id 6a1803df08f44-87dcb558259mr36428246d6.51.1760849970966;
        Sat, 18 Oct 2025 21:59:30 -0700 (PDT)
Received: from mira.orion.internal ([2607:f2c0:b0fc:be00:3640:bdf5:7a8:2136])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87d028ad781sm27154396d6.49.2025.10.18.21.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 21:59:30 -0700 (PDT)
From: Peter Colberg <pcolberg@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Colberg <pcolberg@redhat.com>
Subject: [PATCH 0/2] rust: pci: consistently use INTx and PCI BAR in comments
Date: Sun, 19 Oct 2025 04:56:18 +0000
Message-ID: <20251019045620.2080-1-pcolberg@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6bzvoZtYXkcfkvwEs6BNNM8O5Q8GEVHQ7yta2DvDkdQ_1760849971
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This patch series normalises the comments of the Rust PCI abstractions
to consistently refer to legacy as INTx interrupts and use the spelling
PCI BAR, as a way to familiarise myself with the Rust for Linux project.

Peter Colberg (2):
  rust: pci: refer to legacy as INTx interrupts
  rust: pci: normalise spelling of PCI BAR

 rust/kernel/pci.rs | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

-- 
2.51.0

