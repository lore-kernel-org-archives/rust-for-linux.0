Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773962E3B15
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704326; cv=none; b=klxUMV/MDKn5buemJcrymjWJoIn+Rb/UTr+nA8T6NHcaDhvO4ZTcaTBa8Ar6+PPNyUQzuZ4Q9CkyTsoSYfp0/OmvRpGU/YvzkRJtNDNa3bUTm4TDUnZHCC9MaNBboelW28LLNRggZyztXNIMHy4FJtkN/vsrOs/AeHWIW1JaMNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704326; c=relaxed/simple;
	bh=W95WCLzYMtinxTFTp5aqVioi68i+yJmNYvcw3Nqt62Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NP+dW8BaoIi2iBfnPq0upnrftxsK/4XeGdaehCFQyy07HIZARbaFcaCYvpk2sq9snp7wEGiWjqXlHdGW5Yl/DPmrZzFcf5U9TRHKVRT/1vV0nyJG6TE8SmQ5pjr2To7VEqatpcOeLtlRMs5j8kR0M3ggwJgrgIusohXdne20AxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HWxDHUVR; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HWxDHUVR"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b70b1778687so391177966b.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704323; x=1765309123; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ucl/A5VuIe19EvFSp7fD3FBbP6dyaHWUTjLGc7wy6Qc=;
        b=HWxDHUVRW6LRKmUe3Hh3zDScNaVIqgtDZQk3NJ2oqNmA2wqpD/bcnOovwOx/iKPKdb
         6zQRSELO43L3Rg4vTykWZEUkXZhcS140aZVCX4oQrOe3Jn23876iumDESf6D38NPumiN
         GhOva9mK//PD9Ye86copQO6cEWjqa/tEYEbAyDaiMVwRkdsTN+MXqhPT0iD00D4EaMfw
         P6X4IVUpFYhWEBcoBsQeQbvWVCEO7IWLyIyCdMk5/+rTcEokI6cmODO4nnPbcS+a8l5m
         40Obvvsff3r6ufWhBbNWyJdxrmgn2FVEtixa/y0Wkl8vmP1EMtPmuJ8XSzKe3ALkbJM3
         jBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704323; x=1765309123;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ucl/A5VuIe19EvFSp7fD3FBbP6dyaHWUTjLGc7wy6Qc=;
        b=ikZV8P0grjLW47zp9AQ11PrmrN9MclKQgViAq8eZEzd8un+TdvxwWpgP3dwkg7y2Tx
         XjkNBv5mICQ4lfpj4+/iMr3eHA4WaPCVtM+33z66q2USeA3nOpXJmj7DIB6kHahqNQoz
         9yevLK19VetLqB4gXYe+kVxi665jMJ2Ej7q3/EPoZGhgTmK36bfyVrLxfwylc1jwQZqB
         rOqIqIBTib1zruuyDwPPk6ohOLNf857SbU4EI6vghTbN5Eqd1HeZlo7OAvCNettY8gy3
         QkX/0gBDcfhgFLA7NpKXB0TZmFq+wQUKXUDdbS6LlrtxoUO9jtStg7OVHBO8rinDGxFj
         bqZA==
X-Gm-Message-State: AOJu0YzA0pLGKv13e0AjDwccT4+pBtMJGTpbXTjN5LwVe9ad6JypMnTh
	lWKrpH9MegGhWEqMmHycTqa8cTJcAWq7u7d+AnL49hJC/vvZpNZ14YeMfVqGVTwbUjRebaPzLWI
	0IklmYgqujJIqbi1k96nj9N2RapvYmTtKpOTdpqZEa4oY6YXUnd39+3ZMlSNbeWuPYp+gZ4ZZ4M
	uU5TNuVJeOq2e2JUhMdkzV/QfGeK1LGyE4TfB9yIfepViiBi4TJokK2CWDm/AEUR4=
X-Google-Smtp-Source: AGHT+IGSfLNEmJsBEo0VtOw96b9zkGxTkLhBS1RIWi2gH+uM6RF0QQD62Vyv+IarA0bk91PVktiMmf3pPtkhs9w=
X-Received: from ejcts13.prod.google.com ([2002:a17:907:c5cd:b0:b72:41e4:7557])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:72d2:b0:b77:1233:6f32 with SMTP id a640c23a62f3a-b79d11de4e5mr35988766b.48.1764704323018;
 Tue, 02 Dec 2025 11:38:43 -0800 (PST)
Date: Tue, 02 Dec 2025 19:38:06 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=W95WCLzYMtinxTFTp5aqVioi68i+yJmNYvcw3Nqt62Y=;
 b=kA0DAAoBBFi+7ljGOUYByyZiAGkvQAuiRj25WhDfH68/x7ja9dBraRpyh4J39QjG+gEMVaUYV
 okCMwQAAQoAHRYhBIOSopRNZAcK8Ui9sgRYvu5YxjlGBQJpL0ALAAoJEARYvu5YxjlGM+0P/ixJ
 yJeGrODC+O24NSj3rpf7I3+AXZWPCdD01cTGGr+acEjsS7B5BJWKQFI1jc2fq1/K9NYAUSMlczs
 CnqF/XvhpiSPjJkTLaxJvycECMwxVAs+WS8WNzQWeb2QqKsJgWjQe1iICtVYUBGQYx/o+XmMdsJ
 l790xUytlHL0VEbrzrGKmvPGF1eI7MiYilNNO/i6funkdfjxG1Z8DMySlD+NBj/fyZ+swH52IMW
 2ANjEYRuMVIY161X4uA+9jmXBip5g/e9D4BnNUv81I1m7GaF5qc3N2kIovVX9DkYq5NrJyGq9Jc
 7EYmfSYLWnTsiQK3gR57saH9AsLtBoR1uvGf3kl5uMWKhYLkLWARJa6yElyCowdtZRlsvCotXct
 g+8KTL/T+kJVuXr+UfNVFgnmt0ZAh4A3w+eAVInxlX5qkjZ63Dus5vN+R38HSCTeMNoUaQ5+iU6
 PgopftyxJCAKhMWKXlywjMSDqn6UPsGSKhiI0wKeXsmWM75wqEpodWzhJNGsbd3aDmPo6+a95u2
 g13alHiCv7AfV40x0YVeqOdXHFQ+wUAL1MlM0N4j1vYP8+++yXFTdFrNi7045s2sI/wNDcYpe7t
 ksglta9q7LOzQnW2lsn7ba8JFziCn8lT6CCNWYXNsUvUrMtlaud+uQy7VhxYcKde29aJnx058RU ZRAMw
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-42-a2e13cbc17a6@google.com>
Subject: [PATCH 42/46] rust: uaccess: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 rust/helpers/uaccess.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/helpers/uaccess.c b/rust/helpers/uaccess.c
index f49076f813cd641a55b3a083ac3f7fbcdf53abb6..302e06d264360ac7afd255f434e2f3f8848a5424 100644
--- a/rust/helpers/uaccess.c
+++ b/rust/helpers/uaccess.c
@@ -2,14 +2,14 @@
 
 #include <linux/uaccess.h>
 
-unsigned long rust_helper_copy_from_user(void *to, const void __user *from,
-					 unsigned long n)
+__rust_helper unsigned long
+rust_helper_copy_from_user(void *to, const void __user *from, unsigned long n)
 {
 	return copy_from_user(to, from, n);
 }
 
-unsigned long rust_helper_copy_to_user(void __user *to, const void *from,
-				       unsigned long n)
+__rust_helper unsigned long
+rust_helper_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
 	return copy_to_user(to, from, n);
 }

-- 
2.52.0.158.g65b55ccf14-goog

