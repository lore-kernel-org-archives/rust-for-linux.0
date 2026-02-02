Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B8636165E
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Feb 2026 14:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770043146; cv=none; b=fJpmaz+wuivnNltg9sPdmzqErNXT3vLLwGw8t8BhAJmqCckow+UtjDGCVXmcdjSJu5OkvSIfvAvimXwGu3gyAPLkxQ4BlEk4wUXEsPNXCY0ITh3L3qECSs2hxIEN2TVey64aHWjPmjrqiJK1+phkBv7d8i5Bif25eCmw6g0i9tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770043146; c=relaxed/simple;
	bh=+4wpwF2tKAlflmf16cXGgsMvfr9LWPPap3wSWStUfLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n37HnAmhLqCrT/A4xS86EvIXoDP5aiu1vieGT0D3P8E5RSOFhj3Z8PqwfRtBk6pHeZAESUqiDOFxSx8AE+tfZ0+FWX8S7CU5bK6TprUDcRafchUdu2vyaQv+0FaWy+E5FTZH8b29vzLrzPv8uFhySsIUhze99WQdN+bBz/nCPxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njRZZe8j; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njRZZe8j"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso30229635ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Feb 2026 06:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770043143; x=1770647943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4wpwF2tKAlflmf16cXGgsMvfr9LWPPap3wSWStUfLM=;
        b=njRZZe8jWAta44lvog6x8QgXfPsonhVmxA7PVorYF1y55205dXA1Oo3i0LZ+is+SxR
         WMmX4fI6VH33K0VmJdCx+vf5iT2OLkpoBNNrqEhIvLKDyDM11dJA8JFJywIrur8gLPiJ
         uZm9bEAImxssS1kBgLp6I4Amjyy8Jx+luYpinPfZFrTI0LkTNyfdPPg5MQZwNof4RPBq
         YAWulvVSYcYHK+8OFDUfIuVAcLdroTjT1uMJ/2be+5E35RAGKab2tuajNveCi4/xA3dd
         u+ZSR90s/RHdNYx1WYLGPDckDB9JLBTFzHoyN1nLj4hguByMmSwId3aIq+geNoUWEXzJ
         cx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770043143; x=1770647943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+4wpwF2tKAlflmf16cXGgsMvfr9LWPPap3wSWStUfLM=;
        b=kcXkjLYxfxQeN1xbrJvbVVSBqkgI846jFYEpmGvsei6JxATF46q9ji4f9Uz134lArP
         IIS4i72YHK9Z1Ce/xYyv7PdE6hVEkDahL3HNTo4SJJQsVlEsbfhQvZl8ljF3SdiN8ckO
         0unVZt1D1knvJe/2cnHT2FB856zzcikGebu1vWrn7Sd97o/Y5ocv6q5UqCmsZ1XkUQ0J
         Atj3585JvSyxoe9sXLWfOZhzP8Etod4t09UwyHX7+EdsaLQ26m5PJ8BpXcUTPKtGZ6Nh
         +UNsVQO4091Xxzx2H4Hz7u5sM8JNZvn8rct7PsUhUyb/11wSz+t41FWZZ1hXarNFHRVi
         fwUA==
X-Forwarded-Encrypted: i=1; AJvYcCVRcwGldcH+QaZNQCauT+UMV1Ryqxg7IckwU/VAQAxtl/EoJd8Z8mEPWZP3RKjsisMhR6FJ5DTOW1+mWiclpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8PmWufhWLIvHn1peXGXfsPnFTzPR+KJNr2KhA7ctsM0tKodFG
	EnUl2rY3XDwicwRBDqJKuOYi5lLjD5bp4au8WY3FH3cCXzdqlBUfdJFhW1mkRFW6Krs=
X-Gm-Gg: AZuq6aLCjQJh1WeS91TKlqqCqEfo1vabobId7ewuAsVEzifju055xULUXsF9EqO+h63
	95jLcJYPwAiUNumHbYHEHFjlbgFVUwBYHJnatvu1PVs3JUjYwKXJKHvjCc/q7xmLxlfO6htvfs0
	BcKB08TMLVr/yxXc34HI3tjW80EIg01+OYrpmfE6u2B+Z10EY6oJOIX1z1yHi0BZT0cN3ndjD4p
	75Uun/gBj+t7OBm7N7WAa7fLEcBphlYfwJxUQNIBNnH0WMDxVsyWAhfcPJ5IrRG2oyzHxoDGfAw
	hEft3E1FLkFYwbBq/8lX+HpSisATAiq4+N99/+SknnGOTDQlSw7ysRBOyWsOng0zqCNxcQ6X/xc
	faE6l/jrw6Sd/XMmJ7Diom6TEdJ5s+d1GGAZPy+9S5tb29YOtT+OZlb/RFwjt3Vbpo+OQL2mx9Q
	u2kEU=
X-Received: by 2002:a17:902:fc4e:b0:2a1:2b5f:d16b with SMTP id d9443c01a7336-2a8d990b738mr147462985ad.31.1770043143013;
        Mon, 02 Feb 2026 06:39:03 -0800 (PST)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8ec56da60sm74457655ad.38.2026.02.02.06.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 06:39:02 -0800 (PST)
From: HeeSu Kim <mlksvender@gmail.com>
To: ojeda@kernel.org
Cc: charmitro@posteo.net,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: Makefile: apply fixed-x18 workaround only on arm64
Date: Tue,  3 Feb 2026 08:39:00 +0900
Message-ID: <20260202233900.2699668-1-mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CANiq72kFFFB6k8D9TeSe2hFG3e6AhCqWTMVJXkKyLc8F=TFhbg@mail.gmail.com>
References: <CANiq72kFFFB6k8D9TeSe2hFG3e6AhCqWTMVJXkKyLc8F=TFhbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Feb 03, 2026, Miguel Ojeda wrote:
> Could you please elaborate on the issues you are seeing, e.g. how to
> reproduce them?
>
> The flag is only used to silence errors from checks that were added to
> `rustc` and it is ignored otherwise (that is why the workaround was
> written like that).

After reviewing my build logs, I found that the error I encountered was
"unknown codegen option: -Cunsafe-allow-abi-mismatch" because I was
using rustc 1.85 at the time. The flag was added in rustc 1.88.

So this was not an architecture-specific issue. I apologize for the
confusion and would like to withdraw this patch.

Best regards,
HeeSu Kim
