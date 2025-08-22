Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59289302CD3
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 12:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755867403; cv=none; b=BP1hLOjGZwOWyeQSynBtjWQ5hezfCMiymqYLEU3EochToexYqWCrAgIPa6s+cFfc8pJbQ+kZ0sihFVFbT+o+BxnOoKnt7jujAMMDpADKs8b0k8ZR49s7ZawTv2nzBZry4S4HxYKNdDRksWAThY/aJcjbFgtD5VFXU5n+Tnz/8q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755867403; c=relaxed/simple;
	bh=QcgTbWambBF60BQIQEKWl9c7KUFGhDsO+zeYwk/r4Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxkPzrQnYZlnzrYte3qXl2nmQDFv7Ow35vV3bjXtkF4MzvNQlWwHKJfVeLkH3pJIQjleBK95uTvP5Dh5xCSDYMKYKgo5/iV1U/XzvlsOv5HYQ+pcgCld+8+bjKAjIt+CPc6ETHqMiRDEW4aLW1ZtiKcVN63WHikURyhp71jRceY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=DcKgRGWQ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="DcKgRGWQ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e434a0118so2688620b3a.0
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 05:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1755867401; x=1756472201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ln9ocDQtv3JdgjgPJ2w8JqxkmO9wxFyJcAceGQE4xpc=;
        b=DcKgRGWQiqYEfSnw88Li/LRJS3kk/UzNzxPRjWTaWt18wLJKrdC83vkrxyKaizMQRa
         FW/3RJ2nh0Pmc8yljhdt9oDR+uBBDoziB8Ni+IL/O/dlDJPqCbzn4Buo8C2B8EFFF5W0
         dmSkcQRH2a2ENAJaIKYD+mdfGG5e3dDZAuQgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755867401; x=1756472201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ln9ocDQtv3JdgjgPJ2w8JqxkmO9wxFyJcAceGQE4xpc=;
        b=TXv2GLzfua30K1Yu0v82o9T5m2k36Ls0cCeGziSZT7t8FjYogV6C9WSUzwz8D8GlB9
         WWGrhptXTdUFR/KWdzfU95vT/YodAWbbbxjvJqc41dEEipKoxvQqCjp1cdbU4csVG/Mg
         RokCyFeqlCLpTynh5qPb5BydEOwfeXeBsptPfL4xdynUKOVc+RuHJuty08zAGU+1ELw6
         ZWsYvQ+fiSyZzwJz2ZLMrGSN6a0GkD2IvJs5sosrE5Uwr0HgEGHF6JN8S/bp/I/B2XZw
         thQLddAtlTGFd+lju9bdTS2ur02WgaZwHZZdtquK5hWQ/zS4T/Ug64d4VN2x2IMwQ7SJ
         4Fag==
X-Forwarded-Encrypted: i=1; AJvYcCWSutZXH9+qy1xFf+VSZAZQPxKqnSbTJsMEQGQMxf5hZNSr30k41L0HEL/1ulrsLg/+xhPEnBSgOhf98zP/lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8KbBOqX6DZExSp1SKi6mV6AWzwXBdeIih4OqkAIvDzMdX9aXh
	Zw7TTRrGx7Z8rVsAnlK3xxdvGVwSlrJq37AJcZKpDZAAaU8+B7czj9J2qOoM2njfdNA=
X-Gm-Gg: ASbGncsFSXjTxalCiFRugz6VrwW40H3kZqtIjIG52W1bhVWeb4tro2zcRtSu/McHetn
	G7WtMl9brjqnUEpykvSxJ51kpmvWPTg9KS9Pcmza5ouwfp96U2IJKZedEP1inzh31nbtBvQKTDm
	rPCOJzfZkhb0npD9iH5m66IbKxI5fX/AHfBVipzlLnlL7JaZ8NvWo0RkndsxYNo31PioJZp6kvJ
	2NL3u5Irw4mcmM+fEs/B2Y/Oj2QAPMK1s18R1eT45gyZHXC9LEHldkTP8uf+a2FY99sMOYp6f+N
	HZw0GqE/nKtiR4VhbO9fd+ihpAPtQpsgcBVjayELl7y1RV4c0AbnNUmgldwj6ZiloUBDIb9IlpJ
	C7IfcvqM5XCmkTXH1YJTYVhVr145W/UtaF01wgCKUSNZ32ZI4sYW3ZZFoBqDuIQ==
X-Google-Smtp-Source: AGHT+IH1S3ZNnZrawdMbvtvsQWSSBWdj/g2T1gkOTrmr98XOtngGqtBjqHpAKjepX0TGtaqYnPrHTA==
X-Received: by 2002:a05:6a20:1585:b0:220:94b1:f1b8 with SMTP id adf61e73a8af0-2434092dc84mr4314487637.0.1755867401476;
        Fri, 22 Aug 2025 05:56:41 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([175.195.128.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4764003537sm7194544a12.25.2025.08.22.05.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:56:41 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Jens Axboe <axboe@kernel.dk>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [RFC PATCH v3 2/5] io_uring/cmd: zero-init pdu in io_uring_cmd_prep() to avoid UB
Date: Fri, 22 Aug 2025 12:55:52 +0000
Message-ID: <20250822125555.8620-3-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822125555.8620-1-sidong.yang@furiosa.ai>
References: <20250822125555.8620-1-sidong.yang@furiosa.ai>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pdu field in io_uring_cmd may contain stale data when a request
object is recycled from the slab cache. Accessing uninitialized or
garbage memory can lead to undefined behavior in users of the pdu.

Ensure the pdu buffer is cleared during io_uring_cmd_prep() so that
each command starts from a well-defined state. This avoids exposing
uninitialized memory and prevents potential misinterpretation of data
from previous requests.

No functional change is intended other than guaranteeing that pdu is
always zero-initialized before use.

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 io_uring/uring_cmd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index 053bac89b6c0..2492525d4e43 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -203,6 +203,7 @@ int io_uring_cmd_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	if (!ac)
 		return -ENOMEM;
 	ioucmd->sqe = sqe;
+	memset(&ioucmd->pdu, 0, sizeof(ioucmd->pdu));
 	return 0;
 }
 
-- 
2.43.0

