Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACE334403E
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 16:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580545; cv=none; b=qbTC4JYLHyUa2yZqE67qfrTsan9v5GgVXzqb2/d2gI4pLvq2T/RlchZfcc/TvQhH+pFnPiUE5L/WzAo9Bch6G8+8JczPIBdBuJgKfIjYO+db3LGxFVvni5ZWw4e9Ms5RuxQbK76J9Q8+N5OOxQT0WQdDgZ9tBwT0m+qjHIVROdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580545; c=relaxed/simple;
	bh=/suYFO2aiDzLx5pf2wNYyLyP1AGZocO5gxGtvmn/bCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vrm8T8XH9PZSAtJBWiLuMgwEh1+WxV5K/j2EKTMw0jJYRIEKohDwTHyBfWdhtHW/wVC2wr5G/WLuA212VVYg8FckhJxa917CLFCHEY5ePWJ9UzdLWxTDhW1JuG+96vaJY4D6M4o7q3sILZEfVa+g3S7b9sHVXiSdJ6pLJusl8HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-81f3d6990d6so1316109b3a.3
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 08:22:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768580543; x=1769185343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qK2OTcmGJLYqkGEb2PLg4UAWIeWl8N0pqJhbOZWHbt8=;
        b=UsjsPNFNi/7OgZE6zHZ+ItTotL/QUx7sr8ep2Eq94nAmXAHb9e9+yUpMpldC4tcRxz
         7d/rqNJqmCTiJ1KDTMFy8Kt7HyfckrcVzV1XV1ZrJAxzMMJVz8OanHwOToo2PbqI596T
         rayUsZ3Atsyq1o6O54W9euz35wj9B8Ut51tGnD4bqsblZnc+hUgJ4doIHS9tKHaNsM6Z
         A8UOZ0YnAS7vcpkLmtbfT7kjQFHt/8V5rtxSTuLWf+eoc/XY6p/WFx5DB8l1jq8/t1wv
         Z84UDz0u6Igex3s8doHtnfkxfCvGHg5Ee22SHBrxVWCYEOXWVhYuMeBvSw7rwPjf9vip
         yQmw==
X-Forwarded-Encrypted: i=1; AJvYcCVyBSuyZXXs0oLdAN8dg8qNqYPHqED0oWq8ngFRtKJSaRpMW6Z4oh4aCk4RSAeTOj10EaecRMuHlRKQ5I4jZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMh2V64pCbLQ97B/heXFotNF0sIwBxhv6gCuji2voYmpAnRXBG
	8RiT1X8Mzktx0vLAz7NuxAj1iv377TX6PjuErzgeTSqlSpi1IpTco3bB
X-Gm-Gg: AY/fxX4KMAqvWELiMLkGQ5NxKVMr0tIWS80ykIkK/f3qBN1PkVdaKhjwaoLVyq7X9zR
	ge8JDfKW7Z2axC/EblTtU5BlkyIN0nJAo6WriFZ9jLb8wZ9DWazPRJESUdX8FhYgk5eUiDlGizj
	GsXHl3gCQkiGtpvqcMvoZ+doWsP1IyXocb3k79QIFeX4LSALJ0jEXpy4zqTS0QH0CszOJ+Kw5Av
	sAlR6QgfJpld1STzaijTwFTUy5HjMJEDQLcPB2EQYQqxcY3DndafQ5Lk6TdpwEe2NP5R8PgNK4c
	6bBM+vj9q5pHHNxYm6Is2PkD7AqUOzILCLMUFW7b83iaUyeG+5c4srqjO+GTPJT023gwAU1ZDQk
	oTwJiUlVhFFP86WaRLUHlqDjfQGjkW3hCndfauH4Qs2y5IoleX/gzaiUh6B5Zmx4sHnbT3lrIL+
	51tMV2hmT0MTb+SZAmbaAIMp1La6c60jSlpYz1FACJUieR
X-Received: by 2002:a05:6a20:6a06:b0:384:d0be:9f7c with SMTP id adf61e73a8af0-38dfe71d862mr3381888637.39.1768580543166;
        Fri, 16 Jan 2026 08:22:23 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190aa333sm25165245ad.5.2026.01.16.08.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:22:22 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Alvin Sun <sk.alvin.x@gmail.com>,
	Ke Sun <sunke@kylinos.cn>
Subject: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops callbacks
Date: Sat, 17 Jan 2026 00:21:59 +0800
Message-ID: <20260116162203.296844-2-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116162203.296844-1-sunke@kylinos.cn>
References: <20260116162203.296844-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add rtc_ops_dev() helper to allow drivers to choose whether
rtc_class_ops callbacks receive rtc->dev or rtc->dev.parent. This
enables Rust RTC drivers to store driver data on the RTC device.

The helper checks RTC_OPS_USE_RTC_DEV flag: if set, returns &rtc->dev;
otherwise returns rtc->dev.parent.

Update all rtc_class_ops callback invocations to use rtc_ops_dev(rtc)
instead of directly accessing rtc->dev.parent.

Maintains backward compatibility for existing C drivers.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 drivers/rtc/dev.c       |  6 +++---
 drivers/rtc/interface.c | 18 +++++++++---------
 drivers/rtc/proc.c      |  2 +-
 include/linux/rtc.h     | 15 +++++++++++++++
 4 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
index baf1a8ca8b2b1..eddcc5a69db3b 100644
--- a/drivers/rtc/dev.c
+++ b/drivers/rtc/dev.c
@@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
 		}
 		default:
 			if (rtc->ops->param_get)
-				err = rtc->ops->param_get(rtc->dev.parent, &param);
+				err = rtc->ops->param_get(rtc_ops_dev(rtc), &param);
 			else
 				err = -EINVAL;
 		}
@@ -440,7 +440,7 @@ static long rtc_dev_ioctl(struct file *file,
 
 		default:
 			if (rtc->ops->param_set)
-				err = rtc->ops->param_set(rtc->dev.parent, &param);
+				err = rtc->ops->param_set(rtc_ops_dev(rtc), &param);
 			else
 				err = -EINVAL;
 		}
@@ -450,7 +450,7 @@ static long rtc_dev_ioctl(struct file *file,
 	default:
 		/* Finally try the driver's ioctl interface */
 		if (ops->ioctl) {
-			err = ops->ioctl(rtc->dev.parent, cmd, arg);
+			err = ops->ioctl(rtc_ops_dev(rtc), cmd, arg);
 			if (err == -ENOIOCTLCMD)
 				err = -ENOTTY;
 		} else {
diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index b8b298efd9a9c..4c81130fb0394 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -91,7 +91,7 @@ static int __rtc_read_time(struct rtc_device *rtc, struct rtc_time *tm)
 		err = -EINVAL;
 	} else {
 		memset(tm, 0, sizeof(struct rtc_time));
-		err = rtc->ops->read_time(rtc->dev.parent, tm);
+		err = rtc->ops->read_time(rtc_ops_dev(rtc), tm);
 		if (err < 0) {
 			dev_dbg(&rtc->dev, "read_time: fail to read: %d\n",
 				err);
@@ -155,7 +155,7 @@ int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
 	if (!rtc->ops)
 		err = -ENODEV;
 	else if (rtc->ops->set_time)
-		err = rtc->ops->set_time(rtc->dev.parent, tm);
+		err = rtc->ops->set_time(rtc_ops_dev(rtc), tm);
 	else
 		err = -EINVAL;
 
@@ -200,7 +200,7 @@ static int rtc_read_alarm_internal(struct rtc_device *rtc,
 		alarm->time.tm_wday = -1;
 		alarm->time.tm_yday = -1;
 		alarm->time.tm_isdst = -1;
-		err = rtc->ops->read_alarm(rtc->dev.parent, alarm);
+		err = rtc->ops->read_alarm(rtc_ops_dev(rtc), alarm);
 	}
 
 	mutex_unlock(&rtc->ops_lock);
@@ -441,7 +441,7 @@ static int __rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
 		err = -EINVAL;
 	else
-		err = rtc->ops->set_alarm(rtc->dev.parent, alarm);
+		err = rtc->ops->set_alarm(rtc_ops_dev(rtc), alarm);
 
 	/*
 	 * Check for potential race described above. If the waiting for next
@@ -568,7 +568,7 @@ int rtc_alarm_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
 		err = -EINVAL;
 	else
-		err = rtc->ops->alarm_irq_enable(rtc->dev.parent, enabled);
+		err = rtc->ops->alarm_irq_enable(rtc_ops_dev(rtc), enabled);
 
 	mutex_unlock(&rtc->ops_lock);
 
@@ -618,7 +618,7 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 		rtc->uie_rtctimer.period = ktime_set(1, 0);
 		err = rtc_timer_enqueue(rtc, &rtc->uie_rtctimer);
 		if (!err && rtc->ops && rtc->ops->alarm_irq_enable)
-			err = rtc->ops->alarm_irq_enable(rtc->dev.parent, 1);
+			err = rtc->ops->alarm_irq_enable(rtc_ops_dev(rtc), 1);
 		if (err)
 			goto out;
 	} else {
@@ -874,7 +874,7 @@ static void rtc_alarm_disable(struct rtc_device *rtc)
 	if (!rtc->ops || !test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
 		return;
 
-	rtc->ops->alarm_irq_enable(rtc->dev.parent, false);
+	rtc->ops->alarm_irq_enable(rtc_ops_dev(rtc), false);
 	trace_rtc_alarm_irq_enable(0, 0);
 }
 
@@ -1076,7 +1076,7 @@ int rtc_read_offset(struct rtc_device *rtc, long *offset)
 		return -EINVAL;
 
 	mutex_lock(&rtc->ops_lock);
-	ret = rtc->ops->read_offset(rtc->dev.parent, offset);
+	ret = rtc->ops->read_offset(rtc_ops_dev(rtc), offset);
 	mutex_unlock(&rtc->ops_lock);
 
 	trace_rtc_read_offset(*offset, ret);
@@ -1111,7 +1111,7 @@ int rtc_set_offset(struct rtc_device *rtc, long offset)
 		return -EINVAL;
 
 	mutex_lock(&rtc->ops_lock);
-	ret = rtc->ops->set_offset(rtc->dev.parent, offset);
+	ret = rtc->ops->set_offset(rtc_ops_dev(rtc), offset);
 	mutex_unlock(&rtc->ops_lock);
 
 	trace_rtc_set_offset(offset, ret);
diff --git a/drivers/rtc/proc.c b/drivers/rtc/proc.c
index cbcdbb19d848e..bf688079d0fbb 100644
--- a/drivers/rtc/proc.c
+++ b/drivers/rtc/proc.c
@@ -73,7 +73,7 @@ static int rtc_proc_show(struct seq_file *seq, void *offset)
 	seq_printf(seq, "24hr\t\t: yes\n");
 
 	if (ops->proc)
-		ops->proc(rtc->dev.parent, seq);
+		ops->proc(rtc_ops_dev(rtc), seq);
 
 	return 0;
 }
diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index 95da051fb155d..1dd4a45d0186e 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -83,6 +83,7 @@ struct rtc_timer {
 /* flags */
 #define RTC_DEV_BUSY 0
 #define RTC_NO_CDEV  1
+#define RTC_OPS_USE_RTC_DEV 2
 
 struct rtc_device {
 	struct device dev;
@@ -167,6 +168,20 @@ struct rtc_device {
 #define rtc_lock(d) mutex_lock(&d->ops_lock)
 #define rtc_unlock(d) mutex_unlock(&d->ops_lock)
 
+/**
+ * rtc_ops_dev - Get the device pointer for RTC ops callbacks
+ * @rtc: RTC device
+ *
+ * Returns &rtc->dev if RTC_OPS_USE_RTC_DEV flag is set,
+ * otherwise returns rtc->dev.parent.
+ */
+static inline struct device *rtc_ops_dev(struct rtc_device *rtc)
+{
+	if (test_bit(RTC_OPS_USE_RTC_DEV, &rtc->flags))
+		return &rtc->dev;
+	return rtc->dev.parent;
+}
+
 /* useful timestamps */
 #define RTC_TIMESTAMP_BEGIN_0000	-62167219200ULL /* 0000-01-01 00:00:00 */
 #define RTC_TIMESTAMP_BEGIN_1900	-2208988800LL /* 1900-01-01 00:00:00 */
-- 
2.43.0

