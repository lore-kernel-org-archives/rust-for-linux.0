Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022A83EA66
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Apr 2026 00:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776817882; cv=none; b=gHZVwf8dIvnFp1uaEmkmbcaL0JbAgpgwXIqIeZJ7BgW6zsj2PxvRx2aN0O56tbzmlqYYYfvk2+7807U9n/iSkEUYsYf5WeQxlepI33RAQjceq9exGJHeIqcMaAh3PkyGuCm3K0hDCEBH+FYGUzH082dS7hnei/qJWYjuJrQ9yuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776817882; c=relaxed/simple;
	bh=sO/4d9kT0X5Y6XiWw8K2NKUJZ6lzeUh3Iw41tOYrWlA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JSsl/lHnUq2LopKr2sAjs/K73Iju2R4xgHjyKp5B/3rWqsLD3YWnuegEDakGsZjRHi7HVFjjID+lUpUNIVZV6+DLW1qht35iqUuOl7RZNPI/xOew4/w3c7nXPG3buWed6sonbxDu63syEX0aWboUtVvvOChuZTS8L5GLkzrYL64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6hb9SHV; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6hb9SHV"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50e63771eb0so26399941cf.3
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 17:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776817880; x=1777422680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sO/4d9kT0X5Y6XiWw8K2NKUJZ6lzeUh3Iw41tOYrWlA=;
        b=j6hb9SHVLjnuXaIdb0ApEspw6ahwsfRjynbl8MbJv+SIvaphMW9uekafDKttH6nMFn
         9coKCBhl3oY82PU2J7WrR3ltYnXnl9jBiQtenil0aM7BEHhiymr3N2smG8y786N5RLKD
         tEc8CidPultA/Q+Aqp8WpEn7YWMAE8U7iNXq7bkZQaJX1rfHHC5kXsxeLVHEN2fIPrca
         uv0ohYM8ryEFuSnfNTiMfo8TQIX4kPlU2M9o8QYtD+lfj/XdRr2m/dl5gLeBnB+X0YGb
         CGWlGl+JRqoJ8/aTIyGAGdhpAe7u9cV76fL07u6g2LY5KOeBoGKu7r1ZYDuvvIC+c0YJ
         IrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776817880; x=1777422680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sO/4d9kT0X5Y6XiWw8K2NKUJZ6lzeUh3Iw41tOYrWlA=;
        b=J11ihVgUFP6s9ZlWtjWplCEWyfsp0r+/aGhJI74XVzyleERmYb+crP8H3JPDwRRjTE
         TWopy4kCwY7/2xqwbrasWydmN9q5K9srHRygJoRvzBnKtOpPHFZ1LMQe5QDnE9dvKxGG
         7t7CCwTzx1T9OoSaqBE3XLzU/1hm+hMR6ja8HxA7AaT3KTgojIbzuHegfsM6YdwYXujU
         IWHABP/FE6zSZRD2gRGrkQR1SxAsK2IB08MQrObni9J9Pv8p7zpmqcKZSD5SB97FLCJY
         UlvRcOYxp5lN2Op+p2hqLr1uhgRSNO8yzCdBmzym7/nmaDAZvO18c2yi3p1Q23ztmjCF
         +SYg==
X-Forwarded-Encrypted: i=1; AFNElJ8HOiIwIjzum1Oaersgxpsp7ZsOF7WMqybxWDTagTbe9msq5bwIDr81mLpmpLScWCfHRZ0mXC26leXd69eQjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+4V5wg1IFSv5SZzx2PJ1AnNLUAnpzXTZQyh2ViIOJ1CEGF1vT
	vE4WbmY0EpJ8YhWYL0Qbtn0TGlb7tG3/pW45lZAt0EWlSD9A5Wr0ADsZ
X-Gm-Gg: AeBDieszSEizgrgILJPyIOCFDZ00zYErXXo/IhcgYtUCwgbpR99VUVurYJpmK17a385
	Q7ABxIK07W0KUN4GFUI01wYgajNmQn9SeRwIPwM6UlYKCDzT/Qg1a1meWPpUWVxn3EcwR3lu+GJ
	b2Os1ifQU4kVrz48i3hbtjEvrNTpG5okdT5YzV2TUkQ5BdAGc9AHGmTe7V9NsILVJvhg3lplgxx
	Qvi1pxMbZzPlPVq63cedGn9rGTHfg05UCYnbyWXJEa9lNp+/+ufx6f+oFap4dXtq24FnqbE3rob
	IBBnBhiNiz9a2ksbDrpu5yzBu0WT8JQ7J4SBVV+BmfY0chjTGD4pwsxdTGekYNsuKcXL9tBTrvC
	4xOtLg7DIbql9mqXfoB21koXl1oyIqH9/K77NNKEFCYh0QhbE0T9WcHR188SwGXW2ukgRr4tohe
	a+q/hF1/JeWKUWa/w06Bl7u6Hw3p6s3NFYz9zloOM6snZ83LLSpaCnNWT24iBfGDP3KcUSZwx7N
	deyZexcLOIqPBaw/S4mTNDXkDeXtT871MCjpr49BcOKDdhI/w==
X-Received: by 2002:a05:622a:110c:b0:50b:3a6d:db4b with SMTP id d75a77b69052e-50e36c7c754mr324033051cf.55.1776817879953;
        Tue, 21 Apr 2026 17:31:19 -0700 (PDT)
Received: from TDC4045031631.e0cglfehwr0e5gttmepj3hi3hf.ux.internal.cloudapp.net ([20.63.37.123])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e39130d7csm118897131cf.0.2026.04.21.17.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 17:31:19 -0700 (PDT)
From: Ashutosh Desai <ashutoshdesai993@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Ashutosh Desai <ashutoshdesai993@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add task_work abstraction
Date: Wed, 22 Apr 2026 00:31:17 +0000
Message-Id: <20260422003117.929304-1-ashutoshdesai993@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026042140-trickily-apprehend-0076@gregkh>
References: <20260421063836.742965-1-ashutoshdesai993@gmail.com> <2026042140-trickily-apprehend-0076@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Apr 21, 2026 at 08:44:01AM +0200, Greg KH wrote:
> Do you have a user for this binding so that we can see how it is being
> used to determine if it is correct?

The motivating user is drivers/android/binder/deferred_close.rs, which
calls bindings::init_task_work() and bindings::task_work_add() directly.

Converting it is non-trivial - the current code schedules the task work
before closing the fd on purpose, so it can bail out if scheduling fails
without having already removed the fd. Our API requires the data to be
ready before calling add(), which would reverse that order and change the
error semantics of close_fd().

Happy to send a v2 with a conversion patch if that is the preferred
approach, or to discuss the design first if needed.

Thanks,
Ashutosh
