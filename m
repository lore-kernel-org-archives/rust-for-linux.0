Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EEC36CDE0
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 13:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765979510; cv=none; b=QozS1DdD80prpi0fO+Gv0dzF5vmtfvFwVxL/aWX7eaUK4IJ7OW9sEHs3tl0M5Mthapsrol9eRRMNQnltTy7BS8UK0Ya4MgQo8Imh9Ub7yO0MPuNGf3aRmtReYZiYTKkxJ+944p27rhFxulgd47I0//w0X1fHX9PHOcacoblx/QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765979510; c=relaxed/simple;
	bh=gvrRA4eE1645nCmySiW/20Ebc0HpqumUg4AHvpoOUMo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=S9mlViFIR5906y1bjI75QCzFiFnTdmnGAlrIMTi40zMk0IKr+kusbxHJ++2Ll5g0cgs2nsT8oQ5WCSehx3xq/SAWQxGWPzz95la1FyUAoXlei8mcIG8WGCuRS82Cao7xyP/3+jIGujBD3XTQcqWFD4BmL4IkQpsrKFYeYyxVj1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hJIy4o60; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hJIy4o60"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47799717212so48550005e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 05:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765979506; x=1766584306; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YaSnsIHf1H7dy+Cf1t1HJYcq7ADpf+h2w6CCU5tKiWU=;
        b=hJIy4o60t5peYdeNRcAfdYfuYZfIuUuMew1rII0zFZxiHG58Xq0H8mZwle5l+UJuUA
         4MwlRWNugHMQbBdC8BS0bnHrfyfI+FCAuTngzyVtJccvmrNhs31V3F/OIvMcV6twVwHz
         jXsw8QDtKvvH0Ha+oUnwQWb5FfDLEHut5vVLfUEEXMNH2wFp7kQLE5usxycp2herRgNt
         zqsyi0mpIBqjcJigrwThYKGALx/wlLQzzfCh4LnB7E8oG9jFayXtoFpZVjGv4NwZBWyD
         eRttizIz4vbRWT3DFb01qWh9WIUVyHA1hgXnHCQFeOgwEW116md7dKDINbpXxujuJG2j
         U45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765979506; x=1766584306;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YaSnsIHf1H7dy+Cf1t1HJYcq7ADpf+h2w6CCU5tKiWU=;
        b=tyZ7z6WFMQrqsRS1lfujV+XS1SQvB8sSigJYw3U7xDwkwnUqN8sKqG8czMm/oo4rjM
         b6DL0IGXNeXBgrzG6Sy5mZ0Q//oxfroobeK0shezDSTW8nsZVsfZ0bnoge7zAGx4LgZ4
         2oVBaTJxLH15nKTKWT9ZpfZKXWfMNFIIFDoqLHW4aSkxUX3uYl2eJ2b22HmASSYsQ1ps
         kelIqW4UuN3HUKHuHd1Nu6Q9w+cEkJ+kr0XYNOVyyD9oZ3Yk9mSoiAzLfAs2s0fBq+6X
         Fe1Kx6XjfmkiTdL0Vzw4AcKCYraGnEOZf3ijzAvUMhW9hXhdtnRRgG59WcuKMbD6/xGr
         qIkg==
X-Gm-Message-State: AOJu0YwXBCAUZbfdKrqyBCGsnFN+5AOPdhjpGSV9S4JQhImB0lrir9KU
	MTOuvOPTXrAbhCtb9MNE+74svmjgKFQz8E3yUeI6sO1Bi+GPr9Ax+tXso/xbzP+cmkfGgch+emw
	FqtdAPjh2I9gKLGv50Q==
X-Google-Smtp-Source: AGHT+IEyIfTkFWxd7y+R/vHHr8ef2RDw82yP+V2jDsOBeAJF3rK5eWh9a5Gn4uTdN4pFkOnIXTHPGy6byqkbeeI=
X-Received: from wmco11.prod.google.com ([2002:a05:600c:a30b:b0:477:a0cb:7165])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1ca4:b0:475:dd9a:f791 with SMTP id 5b1f17b1804b1-47bd466125cmr77369695e9.28.1765979506459;
 Wed, 17 Dec 2025 05:51:46 -0800 (PST)
Date: Wed, 17 Dec 2025 13:51:28 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=561; i=aliceryhl@google.com;
 h=from:subject; bh=gvrRA4eE1645nCmySiW/20Ebc0HpqumUg4AHvpoOUMo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpQrU5m8a7Ni+903U6hEagqvho4OsK26yzi9Vnn
 iBfn1ecb2iJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaUK1OQAKCRAEWL7uWMY5
 Rhz9EAC1+aWP92cITr5lHBh5kGkL46L0BqZCYdYNr/5+ZRqxosFA+mXIfbpVZ85tzlEOrjv9DAX
 R9BRua6g/QXUtyjb+i/r9CmAEDTw4SsHsdYf1xTyK08wTxkhcGRHQ1iiAQvPN2R3YU8uv8m0sUI
 HLzBsqVVseGhFQ9xalLiIZCzKw3PAJlCEwLxqnW1BrEplrCG0cl1nE5wJvJA39aq2LtSCP1Z9TB
 UDJMAbh8U+6GmhF1ZcOSuOOpFznelDnGBvsWueo2lOMdF3WmfjFNuMFfV5nJ7d3ATrl+vIKFzYX
 IFKDor2XjNBaZFH9j5bWIrayFkdrLmtwctOjPj0xEtUZlXinLYWzBm+umv++IIEo/YGerHxza52
 hpwPDXk1yOwhi9VQg45AtQPQ+FWf6szbZ6qzDh9PXH+pDdw5n0LLpAFXk8UCId3cP4oHhAJUJFq
 NXYRvI7iEdxJ0Yz3zZMJGUy7PugHz/7W86qIlJztvYJqM7MbgX9vAWgcEFGTTm3AUGK1qtu5ddo
 kbq4EXjTEqVYSkSY9GzW05/9oyR7UHEJBVDeRX8P/as9qaC3L9cW9Siv6v2KzBwIIJj+cFXm3sR
 TxAyLdJlsU+McZ6T7SrefwLPgme09rXygJgXjn3kG4m1JN736QoL3NrsRtUJcBABERWO6VYFwrl vi8iRE8PV2OSPtQ==
X-Mailer: git-send-email 2.52.0.305.g3fc767764a-goog
Message-ID: <20251217135131.153557-1-aliceryhl@google.com>
Subject: [PATCH v2 0/3] bitmap: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"

Yury, I have reformatted the patches as per your request.

Link to v1:
https://lore.kernel.org/all/20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com/

Alice Ryhl (3):
  rust: bitmap: add __rust_helper to helpers
  rust: bitops: add __rust_helper to helpers
  rust: cpumask: add __rust_helper to helpers

 rust/helpers/bitmap.c  |  1 +
 rust/helpers/bitops.c  |  4 ++++
 rust/helpers/cpumask.c | 13 +++++++++++++
 3 files changed, 18 insertions(+)


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.52.0.305.g3fc767764a-goog

