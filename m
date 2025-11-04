Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B03549659
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 20:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762288245; cv=none; b=BVV1Vpd0A2c4LBRcMeQpa7I16iYLvjcVqGQ3djn25tKECFMV4IbLEoYEnuZ/F5Fg3ctJdx3jCQG8xsCqFIVNjMu2bU9x+FWXBQzz3Wdi3v6q3+zq2PzHW5K/Ttring7fgSY7D7zFddQu4CnjEe3IQdAyJhjdrKyavL6M1UYV3Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762288245; c=relaxed/simple;
	bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=jq7ee7m2eodGDpq0XeDM6gtLeArFiw5CIvTMQcJaCg4oQT1uk7i5hrRhi/l1wBFh2a0l+TjImeyTqVVaka/va+o2zCf6XhXIPfmzp0Wa107xiuQMBLM0A+6X7HZJYj2ujv8qBqmT8SSqybi5n7371NdOWlSUWyNQTZH2AncyG84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULr64hok; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULr64hok"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-786a317fe78so4813067b3.2
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 12:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762288243; x=1762893043; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
        b=ULr64hokxOATSknhWQ92/ileSAkC3Aa09IdWwzGBv3uolQkea1XzmxhRkcUj5Yv3BL
         TNQ7f3pe98Wf2p8Dc3bmoGVHWUETrp1371fUg7ZETiwIaN2AQxFKD4NbYhF/FDHhzNmM
         eppLcSu0UGWNPrYVziICEGX+oRza6Uuo5B648nojQXFg8rjXGaneedA9kkVCgwtRCoe0
         At7rPUSlQEuRbi4Uz0TUXNM7pGT866aPCMn9Cv3/vsT+kxlMdPE/ALbYZ+4aWtqVWrl3
         RdJpVv/qheSHlFTGX+EdgRfgQa8PpIyTWmbQu3epx4+9+r9RzZbQTmlav7qJfMGc5aYq
         CC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762288243; x=1762893043;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
        b=BkHZXvFI6wPKAd+2uYlz80YBd5KZA1XA/363XJ++Gi5m/YlZHrBooPPTZC3Z8f9HZ5
         24hdF2EP6gI+smdnz/ZXclKRIcqyW3uEG1kb1GTza3wdrAlccabf62j+DK7V9hjXCpWM
         D0TuWWgP36gdfiz0UdncohxQxNhxSrA3YAkiKPUl40xq94lAzeLcSrlHIGKgZMyR01ch
         /rH6lXXbQeW8oE1Rm6Hm2qI3cHrJZkDboqGBBHIRQ6/IAEC+4OwhAB8MN8aVKfR9yiQb
         sOv1OTiq5XbbEPG5oApsr3IivkIU/LSNU6TDfPBWT3xW4VmZ0nrr8EoBv0BiM6cn0p6x
         BH7w==
X-Gm-Message-State: AOJu0Yw1iD6jJeGFdrynaNbNMfmuMNQuhnyrntGVtgOlF9+GpBqU1e4s
	QJ+FTYOnZK2/eChdgEJVbAHdkQAxgjSezPIomesdFjgL0ultam/j6jOK5XK9SJSTs3MQOOr7aXd
	Gl2kmm4a2NqToarbOJm7PtZvLVuwnL+MpnQ==
X-Gm-Gg: ASbGncuExZm2wEhghmUBxWfk4jaJ2QknbORgrzDvH8VHbjjF8pNMQnCWyeSasvP8g+j
	6MnUA2jIRlqsJSbYYTDVpq1ge7LLY/mDqjV/yKwQD4MlH23/DpRkcZ6UbTIvlegHjulie7Vp9dz
	ekEwmM6mqFM2HN0ZAlFK5FehzUF6Ng0k/ihsO/J/zqOWKzp4ziirIkm6WUFZaqOoAL1eP72nL4g
	QJQ82qCZ6mPWOlIPy4eZQPmXnQyEKQpGDzmGJEdQIF/HqLbQu9KmuuNrYgDHcM=
X-Google-Smtp-Source: AGHT+IEpomwGVBOuidgFsVX0nSJSQlKX3njJkb1DSaRJkDaHJv7lH3oWIO0GACNgLKzVQej4vqrnLmwecvyY2jnEf8U=
X-Received: by 2002:a05:690e:4181:b0:63f:af64:ae5b with SMTP id
 956f58d0204a3-63fd35750c7mr681374d50.41.1762288243139; Tue, 04 Nov 2025
 12:30:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Don Brace <brace77070@gmail.com>
Date: Tue, 4 Nov 2025 14:30:07 -0600
X-Gm-Features: AWmQ_blgKfdCmksfkPVlg5MEhii6dRmPw7FRTFC-IUKzYq52GjQwiKmm-OqFa-4
Message-ID: <CAF=wSYo12UUxfYU0oYt6xa0vaH5kq3eZp7b8rtKupKP+H04kvg@mail.gmail.com>
Subject: subscribe
To: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

subscribe
